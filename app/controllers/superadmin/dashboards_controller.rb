class Superadmin::DashboardsController < Superadmin::BaseController

	def show
		@albums = Album.all
		@songs = Song.all
		@artists = Artist.all
		@genres = Genre.all
		@users = User.all
	end

end