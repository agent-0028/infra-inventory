class CreateServers < ActiveRecord::Migration[6.1]
  def change
    create_table :servers do |t|
      t.string :name
      t.text :description
      t.string :hostname
      t.string :os

      t.timestamps
    end
  end
end
