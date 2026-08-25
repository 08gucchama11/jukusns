class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      t.timestamps
      t.string :password_digest, null: false
      t.string :code, null: false
    end

    add_index :admins, :code, unique: true
  end
end
