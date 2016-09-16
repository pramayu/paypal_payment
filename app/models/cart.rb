class Cart < ApplicationRecord
  has_many :line_items

  def total_price
    line_items.to_a.sum(&:full_price)
  end

  def paypal_url(return_url, notify_url)
    values = {
      :business => "khapoo@mail.com",
      :cmd => "_cart",
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.product.id,
        "receiver_id_#{index+1}" => item.product.user.id
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.to_query
  end

end
