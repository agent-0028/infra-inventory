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

## Dev Notes

Server.all.map{ |s| puts "#{s.hostname}: #{s.description}" }

Server.all.preload(:credential).map{ |s| puts "#{s.hostname}: #{s.credential.description}" }

FullyQualifiedDomainName.preload(:domain_name).all.map{ |f| puts "#{f.hostname}.#{f.domain_name.name}" }

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
