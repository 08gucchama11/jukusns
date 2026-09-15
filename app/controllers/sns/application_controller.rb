class Sns::ApplicationController < ::ApplicationController
  layout "sns"
  include Sns::Authentication
end