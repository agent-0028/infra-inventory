class DnsRecord < ApplicationRecord
  belongs_to :server
  belongs_to :fully_qualified_domain_name
end
