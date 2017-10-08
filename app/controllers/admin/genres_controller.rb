class Admin::GenresController < Admin::BaseController
	before_action :authorize_for_admins
	before_action :find_genre, { only: [:edit, :update, :show, :destroy] }

	def index
		@genres = Genre.all
	end
	
	def new
		@genre = Genre.new
	end
	
	def create
		@genre = Genre.new(genre_params)
		@genre.user_id = current_user.id
    if @genre.save
			redirect_to admin_genres_path, success: 'Genre created successfully'
		else
			render :new
		end
  end

  def edit
  	unless @genre.user_id == current_user.id || current_user.superadmin?
  		redirect_to root_path, danger: 'Permisson denied!'
  	end
  end

  def update
  	if @genre.update(genre_params)
			redirect_to admin_genres_path, success: 'Genre successfully updated!'
		else
			render :edit
		end
	end

	def show
		@album = @genre.albums
		@song = @genre.songs
	end

  def destroy
  	unless @genre.user_id == current_user.id || current_user.superadmin?
  		redirect_to root_path, danger: 'Permisson denied!'
  	else 	
	  	@genre.destroy
	  	redirect_to admin_genres_path, danger: 'Genre deleted!'
	  end	
  end

  private

  def genre_params
  	params.require(:genre).permit(:name);
  end
  
  def find_genre
  	@genre = Genre.find(params[:id])
  end
end 		 				
