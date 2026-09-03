class CreateSnsProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :sns_profiles do |t|
      t.references :student, foreign_key: true, index: { unique: true }
      t.references :teacher, foreign_key: true, index: { unique: true }
      t.string :nickname, null: false
      t.string :introduction
      t.timestamps
    end
  end
end
