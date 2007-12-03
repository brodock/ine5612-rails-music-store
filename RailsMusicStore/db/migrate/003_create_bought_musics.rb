class CreateBoughtMusics < ActiveRecord::Migration
  def self.up
    create_table :bought_musics do |t|
    end
  end

  def self.down
    drop_table :bought_musics
  end
end
