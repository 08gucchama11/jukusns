class CreateAnnouncements < ActiveRecord::Migration[8.0]
  def change
    create_table :announcements do |t|
      t.timestamps
      t.string :title, null: false
      t.text :body, null: false
    end
  end
end
