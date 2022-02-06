# Backend For The Social Recipe Application
This project was created to do the server side handling for The Social Chef frontend application. It will also be in charge of persisting data to our SQLite3 database.

We used the "thin" webserver combined with "rack" middle ware and Sinatra to handle the routes and Active record to handle data in the database.

## Installation
Fork and clone this repository then run bundle install. 
To run the server use the command rake server. The server runs on localhost:9292.

## Usage

# returns 'users'
localhost:3000/users

# returns 'user'
localhost:3000/users/:id

# returns 'recipes'
localhost:3000/recipes

# returns 'recipe'
localhost:3000/recipes/:id

# deletes 'recipe'
localhost:3000/recipes/:id/delete_recipe

# creates 'recipe'
localhost:3000/create_recipe


