class DomainName < ApplicationRecord
    has_and_belongs_to_many :servers
end