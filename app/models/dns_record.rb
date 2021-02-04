class DnsRecord < ApplicationRecord
  belongs_to :servers
  belongs_to :fully_qualified_domain_name
end
