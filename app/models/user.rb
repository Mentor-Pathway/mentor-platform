class User < ApplicationRecord
  validates :first_name, :last_name, :role, presence: true
  validates :email, uniqueness: true
  validates :role, presence: true
  enum :role, { mentor: 0, mentee: 1 }  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


 # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

