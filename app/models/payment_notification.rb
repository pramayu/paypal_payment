class PaymentNotification < ApplicationRecord
  belongs_to :cart
  serialize :params
  after_create :mark_as_purchased


  def mark_as_purchased
    if status == "Completed"
      cart.update_attribute(:purchased_at, Time.now)
    end
  end
end
