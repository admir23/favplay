class Superadmin::DashboardsController < Superadmin::BaseController

	def show
	 unless current_user.admin? || current_user.superadmin?
	 	 flash[:notice] = "You don't have rights to this page"	
	 	 redirect_to root_path
	 else	 
			@albums = Album.all
			@songs = Song.all
			@artists = Artist.all
			@genres = Genre.all
			@users = User.all
	 	end	
	end

end