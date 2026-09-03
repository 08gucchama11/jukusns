class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.timestamps
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :code, null: false
      t.string :school, null: false
      t.integer :grade, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.string :parent_name, null: false
      t.string :parent_telephone_number, null: false
      t.boolean :is_active, null: false, default: true
    end

    add_index :students, :code, unique: true
  end
end
