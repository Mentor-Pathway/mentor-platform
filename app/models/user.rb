class User < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, :last_name, format: {with: /\A[a-zA-Z0-9 ]+\z/}
  validates :email, uniqueness: true
  validate :password_regex
  has_one :profile, dependent: :destroy
  has_many :pathways, dependent: :destroy
  has_many :user_challenges, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_pathways, dependent: :destroy

  enum :role, {mentor: 0, mentee: 1}
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable
  # Creates profile and associates it to given user instance. Method only called upon initial user creation
  after_create :create_profile

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name
      user.last_name = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private_class_method

  def self.create_profile
    Profile.create(
      user: self

   )
  end

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/
    errors.add :password, "Password should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character"
  end
end

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
