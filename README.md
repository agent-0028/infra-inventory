# README

## Daily Operations

### Run the database

```
# first time
docker-compose up -d
# stop for the day
docker-compose stop
# live to code another day
docker-compose start
```

### Wipe and recreate database

```
bin/rails db:drop
bin/rails db:create
bin/rails db:migrate
bin/rails db:fixtures:load
```

## Dev Notes

Server.all.map{ |s| puts "#{s.hostname}: #{s.description}" }

Server.all.preload(:credential).map{ |s| puts "#{s.hostname}: #{s.credential.description}" }

FullyQualifiedDomainName.preload(:domain_name).all.map{ |f| puts "#{f.hostname}.#{f.domain_name.name}" }

### 3/8/2024

With now using Ruby 3.3.0, bundle install is having issues with the usual postgres crap.

This appears to work.

I do not know how to pass that argument from Gemfile.

```
gem install pg -- --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config
```

### 2/3/2021

These are the generator commands I am using for models and migrations:

```
rails g model DomainName name registrar

rails g model Credential description

rails g model FullyQualifiedDomainName hostname domain_name:references

rails g model Server hostname description fully_qualified_domain_name:references credential:references

rails g model DnsRecord description dns_server server:references fully_qualified_domain_name:references

rails g model CloudProvider name description credential:references
```
### 1/26/2021

Mostly following instructions from here: https://devcenter.heroku.com/articles/getting-started-with-rails6

Set up a simple docker-compose for local dev and configured database.yml to match the user/pass in that file before trying to have Rails create a db.
