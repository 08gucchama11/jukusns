class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.timestamps
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :code, null: false
      t.string :telephone_number, null: false
      t.boolean :is_active, null: false, default: true
    end

    add_index :teachers, :code, unique: true
  end
end
