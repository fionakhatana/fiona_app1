class ActorsController < ApplicationController
  def index
   @actors=Actor.all
  end
  def show
    @actor=Actor.find(params[:id])
    @movies= @actor.movies
  end
  def edit
    @actor=Actor.find(params[:id])
    
  end
  def create
    
    @actor=Actor.new(actors_params)
    if @actor.save
      redirect_to actors_path
    else
      render action: 'new'
    end
   # p params[:actor]
  end

  def actors_params
    puts params.require(:actor).permit(:name)
    params.require(:actor).permit(:name)
  end
  def new
    @actor = Actor.new
  end
  def del
   
  end
  def destroy
    @ac = Actor.where(id:params[:id])
    @ac[0].destroy
    redirect_to actors_path
  end
  def update
    ac = Actor.find(params[:id])
    ac.name=params[:ac_name] 
    if ac.save 
      redirect_to actors_path
    else
      render action: 'edit'
    end
  end
end
