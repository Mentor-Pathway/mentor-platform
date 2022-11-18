class User < ApplicationRecord
  validates :first_name, :last_name, :role, presence: true
  validates :first_name, :last_name, format: {with: /\A[a-zA-Z0-9 ]+\z/}
  validates :email, uniqueness: true
  validates :role, presence: true
  validate :password_regex

  enum :role, {mentor: 0, mentee: 1}
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/
    errors.add :password, "Password should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character"
  end              
end

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
