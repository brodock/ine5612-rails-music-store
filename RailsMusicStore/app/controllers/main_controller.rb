class MainController < ApplicationController
  def index
    @music_pages, @musics = paginate :musics, :per_page => 10
  end
end
