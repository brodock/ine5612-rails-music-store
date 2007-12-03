class BoughtMusic < ActiveRecord::Base
  belongs_to :musics
  belongs_to :users
end
