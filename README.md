# FlickPick Internal API

This repository contains the internal API used by the FlickPick front end. The API makes external calls to TMDB (The Movie Database) to fetch movie data, which is then utilized by FlickPick to present movies to users and their watch parties.

## Ruby Version
This project uses Ruby version 3.2.2.

## Database Setup
To initialize the database, run the following commands:
```bash
rails db:{drop,create,migrate,seed}
```
## Running the Test Suite

To run the test suite, execute the following command:

```bash
bundle exec rspec
```

## Running the Server

To run the server, execute the following command:

```bash
rails s
```

## Note that in order to make the Front End tests pass, you must run the backend server in the background.
