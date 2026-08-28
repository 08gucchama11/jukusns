class Student < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :instruction_records
  has_one :sns_profile

  validates :code, presence: true, uniqueness: true
  validates :name, :school, :postal_code, :address, :telephone_number, :parent_name, :parent_telephone_number, presence: true
  validates :grade, inclusion: { in: 1..6 }
  validates :is_active, inclusion: { in: [true, false] }
  validates :password, length: { minimum: 6 }, allow_nil: true
end