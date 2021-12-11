class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname    , presence: true
    validates :encrypted_password, format: { with: /[a-z\d]{6,}/i }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name1
    validates :first_name1
  end
  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :last_name2
    validates :first_name2
  end
  validates :birthday    , presence: true


end
