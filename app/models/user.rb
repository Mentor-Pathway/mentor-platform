class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, presence: true
  
  enum role: [:mentor, :mentee]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
