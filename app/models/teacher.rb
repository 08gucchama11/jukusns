class Teacher < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :instruction_records
  has_one :sns_profile

  validates :code, presence: true, uniqueness: true
  validates :name, :telephone_number, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :password, length: { minimum: 6 }, allow_nil: true
end