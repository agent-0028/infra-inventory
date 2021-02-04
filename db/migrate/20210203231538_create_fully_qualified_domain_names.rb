class CreateFullyQualifiedDomainNames < ActiveRecord::Migration[6.1]
  def change
    create_table :fully_qualified_domain_names do |t|
      t.string :hostname
      t.references :domain_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
