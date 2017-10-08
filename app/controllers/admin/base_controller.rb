class Admin::BaseController < ApplicationController
	before_action :authorize_for_admins

  layout 'admin'
end 