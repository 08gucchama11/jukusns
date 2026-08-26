class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :admin, to: :session, allow_nil: true
  delegate :student, to: :session, allow_nil: true
  delegate :teacher, to: :session, allow_nil: true
end
