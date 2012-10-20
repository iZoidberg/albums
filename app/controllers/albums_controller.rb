class AlbumsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @albums = Album.by_user(current_user.id).all
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])
    redirect_to albums_path
  end

  def create
    album = Album.new(params[:album])
    album.user_id = current_user.id
    if album.save
      redirect_to albums_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def search
  end
end
