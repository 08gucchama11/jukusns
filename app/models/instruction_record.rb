class InstructionRecord < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validates :subject, presence: true, inclusion: { in: 1..6 }
  validates :unit, presence: true
  validates :instruction_record, presence: true
end