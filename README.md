# Databases

## User Story
```
As a user
To be able to see my bookmarks
I'd like to see a list of my bookmarks
```
<br>

## Domain Model

![Screenshot 2022-05-09 at 15 35 21](https://user-images.githubusercontent.com/58693804/167434450-912649f8-b31b-4554-95ba-abf046ecfc24.png)

Identified the MVC (model, controller, view) design pattern for the development of the user interfaces (client). <br>
This helps to create the classes/methods, as well as identify the files that may be relevant to make in the creation of the app.

<br>

## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 3000
```

To view bookmarks, navigate to `localhost:3000/bookmarks`.

### To run tests:

```
rspec
```

### To run linting (clear up indentation, new lines etc.):

```
rubocop
```
