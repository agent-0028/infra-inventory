class Server < ApplicationRecord
  belongs_to :fully_qualified_domain_name
  belongs_to :credential
end
