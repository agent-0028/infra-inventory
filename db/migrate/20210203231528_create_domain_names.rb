class CreateDomainNames < ActiveRecord::Migration[6.1]
  def change
    create_table :domain_names do |t|
      t.string :name
      t.string :registrar

      t.timestamps
    end
  end
end
