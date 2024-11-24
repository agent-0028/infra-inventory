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

### Useful bits

```
Credential.all.map do |c|
    puts "#{c.description}"
    puts "Servers"
    c.servers.map do |s|
        puts "#{s.hostname}"
    end
    puts "Cloud Providers"
    c.cloud_providers.map do |s|
        puts "#{s.name}"
    end
end

Server.all.map { |s| puts "#{s.hostname}: #{s.description}" }

Server.all.preload(:credential).map { |s| puts "#{s.hostname}: #{s.credential.description}" }

FullyQualifiedDomainName.preload(:domain_name).all.map { |f| puts "#{f.hostname}.#{f.domain_name.name}" }

CloudProvider.all.map { |c| puts "#{c.name} - #{c.description}" }

Credential.all.map { |c| puts "#{c.description}" }
```

### 11/20/2024

Super rapid upgrade from 6.1 => 7.2 went great!

Upgrade from 7.2 => 8.0.0

Got an error running `app:update`:

```
/Users/tinisi/.rbenv/versions/3.3.0/lib/ruby/3.3.0/bundled_gems.rb:74:in `require': cannot load such file -- active_support/basic_object (LoadError)
```

Deleted the Gemfile.lock

Re-ran `bundle`

bundle config set --global build.libpg --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config

That got me past the error!

...and on to a new one.

Running:
```
bin/rails app:update   
```

> Puma 5 is not compatible with Rack 3, please upgrade to Puma 6 or higher

### 9/12/2024

https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

Rails 7.2 requires Ruby 3.1.0 or newer.
Rails 7.0 and 7.1 requires Ruby 2.7.0 or newer.
Rails 6 requires Ruby 2.5.0 or newer.

Change the Rails version number in the Gemfile and run bundle update rails.
Change the versions for Rails JavaScript packages in package.json and run bin/rails javascript:install if running jsbundling-rails.
Run the Update task.
Run your tests.

https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#upgrading-from-rails-6-1-to-rails-7-0
https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#upgrading-from-rails-7-0-to-rails-7-1


### 3/9/2024

https://bundler.io/v2.5/man/bundle-config.1.html#BUILD-OPTIONS

Found the instructions to make this specific to a machine:

bundle config set --global build.libpg --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config

### 3/8/2024

With now using Ruby 3.3.0, bundle install is having issues with the usual postgres crap.

This appears to work.

I do not know how to pass that argument from Gemfile.

```
gem install pg -- --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config
```

Having problems with that one thread error.

This is working:

```
export DISABLE_SPRING=true 
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
