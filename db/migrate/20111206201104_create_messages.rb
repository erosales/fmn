class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.date :date
      t.time :time
      t.text :message
      t.integer :phone

      t.timestamps
    end
  end
end
