class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.references :follower_sns_profile, null: false, foreign_key: { to_table: :sns_profiles }
      t.references :followed_sns_profile, null: false, foreign_key: { to_table: :sns_profiles }
      t.timestamps
    end

    add_index :follows, [ :follower_sns_profile_id, :followed_sns_profile_id ], unique: true
  end
end
