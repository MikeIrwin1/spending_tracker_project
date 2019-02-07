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

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
