class SongsController < ApplicationController

#put routes in routes.rb

#define new, create(@song = song.new), update, edit, delete, index, sho

  def index
    #binding.pry
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name)
  end

end
