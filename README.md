# Spending Tracker Project

This is a Ruby full stack application using Sinatra to create the front end and Ruby with SQL to create the backend. The application allows you to perform CRUD actions on merchants and categories in order to track individual transactions made by the user to track their spending. The application allows you to create a budget and gives warning when approaching or over your created budget.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

A few required RubyGems must be installed in order to get the project up and running.

1. PostgreSQL must be installed in order to create and manage databases.

2. Sinatra must be installed to run the webserver.

```
gem install sinatra
```

3. PG is the Ruby interface to our PostgreSQL database.

```
gem install PG
```

### Installing

A step by step series of examples that tell you how to get a development env running

Create a database and schema

```
createdb spending_tracker
psql -d "spending_tracker" db/spending_tracker.sql
```

Seed the database

```
ruby db/seeds.rb
```

Run the app

```
ruby app.rb
```

Head to your favourite browser and view the page

```
localhost:4567
```

## Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [MiniTest](http://docs.seattlerb.org/minitest/)
* [Sinatra](http://sinatrarb.com/)
