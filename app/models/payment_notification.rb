class PaymentNotification < ApplicationRecord
  belongs_to :cart
  serialize :params
  after_create :mark_as_purchased, :notification_to_user


  def mark_as_purchased
    if status == "Completed"
      cart.update_attribute(:purchased_at, Time.now)
    end
  end

  def notification_to_user
    cart.line_items.each do |item|
      Notification.create(user_id: item.product.user.id,
                         notified_by_id: params[:custom],
                         product_id: item.product.id,
                         notice_type: "bought")
    end
  end
end
