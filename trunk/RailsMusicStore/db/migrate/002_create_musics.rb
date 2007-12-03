class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
    end
  end

  def self.down
    drop_table :musics
  end
end
