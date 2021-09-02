class PlatformController < ApplicationController
  before_action :authenticate_admin!
  layout 'platform'
end
