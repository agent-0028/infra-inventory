class Credential < ApplicationRecord
    has_many :cloud_providers
    has_many :servers
end
