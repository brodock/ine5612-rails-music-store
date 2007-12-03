class Music < ActiveRecord::Base
  has_many :bought_musics,
    :foreign_key => 'music_id'
  
  has_many :users,
    :through => :bought_musics
end
