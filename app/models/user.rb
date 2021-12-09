class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname    , presence: true
  validates :last_name1  , presence: true
  validates :first_name1 , presence: true
  validates :last_name2  , presence: true
  validates :first_name2 , presence: true
  validates :birthday    , presence: true

  
end
