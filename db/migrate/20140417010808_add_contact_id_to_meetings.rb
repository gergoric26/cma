class AddContactIdToMeetings < ActiveRecord::Migration
  def change
    add_reference :meetings, :contact, index: true
  end
end
