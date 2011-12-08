class CreateUsers < ActiveRecord::Migration
  has_one :email
  has_many :messages
  
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
