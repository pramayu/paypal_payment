class Product < ApplicationRecord
  has_many :line_items
  has_many :notifications
  belongs_to :user
end
