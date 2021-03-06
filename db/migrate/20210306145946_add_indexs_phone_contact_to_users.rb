class AddIndexsPhoneContactToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :phone_contact, unique: true
  end
end
