class CreateCloudProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_providers do |t|
      t.string :name
      t.string :description
      t.references :credential, null: false, foreign_key: true

      t.timestamps
    end
  end
end
