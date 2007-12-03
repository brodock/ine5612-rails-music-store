class Music < ActiveRecord::Base
  has_many :bought_musics,
    :foreign_key => 'musics_id'
  
  has_many :users,
    :through => :bought_musics
  
  belongs_to :artist
end
