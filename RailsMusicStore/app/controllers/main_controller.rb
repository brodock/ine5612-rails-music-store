class MainController < ApplicationController
  def index
    @music_pages, @musics = paginate :musics, :per_page => 10
    
    unless @current_user.blank?
      @my_musics = @current_user.musics 
    end
  end
  
  def my_musics
    unless @current_user.blank?
      @my_musics = @current_user.musics 
    end
    render :layout => 'ajax'
  end
end
