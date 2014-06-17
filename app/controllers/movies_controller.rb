class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def edit
    @movie = Movie.find(params[:id])
    @actor = Actor.all
  end
  def update 
    @movie = Movie.find(params[:id])  
    if params[:stars] > 0
      p "done"  
    else
      if @movie.update_attributes(movies_params)
        redirect_to movies_path
      else
        render action: 'edit'
      end
    end
  end

  def new
    @movie = Movie.new
    @actor = Actor.all
  end
  def show 
    
    @movie_rate=Rating.new
    @movie = Movie.find(params[:id])     
    @songs = @movie.songs 
    @actors = @movie.actors
    @role = Array.new
    @actors.each do |a|
      a.movie_actors.each do |acto|
        if acto.movie_id == @movie.id
      #    p acto.movie_id
      #    p acto.actor_id
          @role.push(acto.role)
        end
      end
    end
  end
  def create
      @movie = Movie.new(movies_params)
    if @movie.save
      redirect_to movies_path
    else
      render action: 'new'
    end 
  end
  def movies_params
     params.require(:movie).permit(:name,songs_attributes: [:id, :name, :_destroy ],movie_actors_attributes: [:id,:actor_id, :name, :role,:_destroy])
#,{:songs_attributes => [:name,:_destroy]})
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end
end
