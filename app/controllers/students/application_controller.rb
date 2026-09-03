class Students::ApplicationController < ::ApplicationController
  layout "students"
  include Students::Authentication
end
