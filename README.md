# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Jobs
`ScrapRpfProjectsJob.perform_now`

## Dev
`docker-compose up` to get the dbs started (dev and test)
`rails db:create && rails db:migrate && rails db:seed` will give you a fully fed env
`rails s` finally to get the server running
### Useful cmds
  `rails db:drop && rails db:create && rails db:migrate && rails db:seed` to reseed everything. This also avoid you having to use `docker-compose down -v`

## Deployment

### First 
https://devcenter.heroku.com/articles/getting-started-with-rails5#create-a-new-rails-app-or-upgrade-an-existing-one
