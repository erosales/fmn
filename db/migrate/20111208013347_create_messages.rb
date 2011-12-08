class CreateMessages < ActiveRecord::Migration
  belongs_to :user
  
  def self.up
    create_table :messages do |t|
      t.date :date
      t.time :time
      t.text :message
      t.integer :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
