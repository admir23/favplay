class GenresController < ApplicationController
	before_action :authorize
	before_action :find_genre, { only: [:show] }

	def index
		@genres = Genre.all
	end
	
	def show
		@album = @genre.albums
		@song = @genre.songs
	end

  

  private

  def genre_params
  	params.require(:genre).permit(:name);
  end
  
  def find_genre
  	@genre = Genre.find(params[:id])
  end
end 		 				
