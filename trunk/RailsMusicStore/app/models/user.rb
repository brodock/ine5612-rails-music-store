class User < ActiveRecord::Base
  has_many :bought_musics,
    :foreign_key =>   'users_id'
  
  has_many :musics,
    :through => :bought_musics
  
  validates_presence_of :name,:passwd,:email,:cpf
end
