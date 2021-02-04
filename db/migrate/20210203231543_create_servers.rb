class CreateServers < ActiveRecord::Migration[6.1]
  def change
    create_table :servers do |t|
      t.string :hostname
      t.string :description
      t.references :fully_qualified_domain_name, null: false, foreign_key: true
      t.references :credential, null: false, foreign_key: true

      t.timestamps
    end
  end
end
