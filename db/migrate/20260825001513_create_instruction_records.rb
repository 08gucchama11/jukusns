class CreateInstructionRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :instruction_records do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :subject, null: false
      t.string :unit, null: false
      t.text :instruction_record, null: false
      t.timestamps
    end
  end
end