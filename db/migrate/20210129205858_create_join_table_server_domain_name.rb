class CreateJoinTableServerDomainName < ActiveRecord::Migration[6.1]
  def change
    create_join_table :domain_names, :servers do |t|
      t.index [:domain_name_id, :server_id]
      t.index [:server_id, :domain_name_id]
    end
  end
end
