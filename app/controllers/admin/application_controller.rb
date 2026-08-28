class Admin::ApplicationController < ::ApplicationController
  layout "admin"
  include Admin::Authentication
end