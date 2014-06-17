class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end
  def show
    p params[:name]
    user1 = User.where(name:params[:name])
    p user1
    total = 10
    @rating_movie = Array.new
    @rating_song = Array.new
#    @user = User.find(params[:id])
    @user = user1[0]
    @movies = Movie.all
    @songs = Song.all
    
    @movies.each do |movie|
      rate_sum = 0
      total = 0
      rate = movie.ratings
      rate.each do |r|
        rate_sum = rate_sum+r.stars
        total = total + 1
      end
      if total > 0
        @rating_movie.push(rate_sum/total)
      else
        @rating_movie.push(0)
      end
    end

    
    @songs.each do |song|
      rate_sum = 0
      total = 0
      rate = song.ratings
      rate.each do |r|
        rate_sum = rate_sum+r.stars
        total = total + 1
      end
      if total > 0
        @rating_song.push(rate_sum/total)
      else
        @rating_song.push(0)
      end
    end
  end
  def new
    @rating = Rating.new
  end
  def edit
     @rating=Rating.new
  end

  def create
    @user = User.find(params[:user_id])
    p @user.name
    if params[:type] == 'Movie'
       if @user.ratings.create(stars:params[:stars],rateable:Movie.find(params[:id]))
         p params[:stars]
         p "movie"
         redirect_to user_path(@user,name:@user.name)
       else
         render action: 'edit'
       end
    else
       if @user.ratings.create(stars:params[:stars],rateable:Song.find(params[:id]))
         p "song"
         redirect_to users_path(@user,name:@user.name)
       else
         render action: 'edit'
       end
    end
  end
end
