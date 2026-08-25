class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :sns_profile, null: false, foreign_key: true
      t.timestamps
    end

    add_index :likes, [:post_id, :sns_profile_id], unique: true
  end
end