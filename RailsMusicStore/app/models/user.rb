class User < ActiveRecord::Base
  
  has_and_belongs_to_many :musics
  
  validates_presence_of :name,:passwd,:email,:cpf
  validates_numericality_of :cpf
  validates_uniqueness_of :name
end
