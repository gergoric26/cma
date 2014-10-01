class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :purpose
      t.string :attendance
      t.string :timeAndDate
      t.string :location
      t.text :notes
      t.string :uploadDocuments

      t.timestamps
    end
  end
end
