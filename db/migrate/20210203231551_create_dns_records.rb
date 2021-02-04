class CreateDnsRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :dns_records do |t|
      t.string :description
      t.string :dns_server
      t.references :servers, null: false, foreign_key: true
      t.references :fully_qualified_domain_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
