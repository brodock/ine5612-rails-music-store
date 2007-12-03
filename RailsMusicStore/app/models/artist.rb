class Artist < ActiveRecord::Base
  has_many :musics,
    :foreign_key => "musics_id"
  
end
