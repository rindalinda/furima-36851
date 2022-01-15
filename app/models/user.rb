class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters' } do
    validates :last_name1
    validates :first_name1
  end

  with_options presence: true,
               format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/,
                         message: 'Input full-width katakana characters' } do
    validates :last_name2
    validates :first_name2
  end

  validates :birthday, presence: true
end
