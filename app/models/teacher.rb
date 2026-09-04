class Teacher < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :instruction_records
  has_one :sns_profile, dependent: :destroy

  validates :code, presence: true, uniqueness: true
  validates :name, :telephone_number, presence: true
  validates :is_active, inclusion: { in: [ true, false ] }
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_create :create_default_sns_profile

  private

  def create_default_sns_profile
    create_sns_profile!(nickname: name)
  end
end