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
### 1/26/2021

Mostly following instructions from here: https://devcenter.heroku.com/articles/getting-started-with-rails6

Set up a simple docker-compose for local dev and configured database.yml to match the user/pass in that file before trying to have Rails create a db.
