class Superadmin::BaseController < ApplicationController
 before_action :authorize

 layout 'superadmin'
end 