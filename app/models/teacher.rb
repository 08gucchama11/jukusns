class Teacher < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  has_many :instruction_records
  has_one :sns_profile
end
