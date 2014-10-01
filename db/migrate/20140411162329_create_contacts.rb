class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstName
      t.string :lastName
      t.string :streetAddress
      t.string :city
      t.string :state
      t.string :zip
      t.string :phoneNumber
      t.string :alternatePhoneNumber
      t.text :comments
      t.string :birthday
      t.string :uploadDocuments

      t.timestamps
    end
  end
end
