class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :send_day

  validates :image, :item_name, :explain, :category, :status, :charge, :prefecture, :send_day, :price, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :charge_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true }
end
