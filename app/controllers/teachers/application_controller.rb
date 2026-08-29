class Teachers::ApplicationController < ::ApplicationController
  layout "teachers"
  include Teachers::Authentication
end