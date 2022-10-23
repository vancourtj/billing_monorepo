class CreateBillingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_addresses, id: :uuid do |t|
      t.string :name
      t.string :email_address
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
