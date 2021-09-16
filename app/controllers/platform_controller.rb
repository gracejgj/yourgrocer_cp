class PlatformController < ApplicationController
  before_action :authenticate_vendor!
  layout 'platform'
end
