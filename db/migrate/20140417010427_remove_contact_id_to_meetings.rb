class RemoveContactIdToMeetings < ActiveRecord::Migration
  def change
    remove_reference :meetings, :contact_id, index: true
  end
end
