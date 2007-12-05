class CreateMusicsUsers < ActiveRecord::Migration
  def self.up
    create_table :musics_users do |t|
    end
  end

  def self.down
    drop_table :musics_users
  end
end
