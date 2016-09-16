class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :product, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.references :notified_by, index: true
      t.string :notice_type

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
