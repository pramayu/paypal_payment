class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart 
  has_many :notifications


  def full_price
    unit_price * 1
  end
end
