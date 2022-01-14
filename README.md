# Neigh-bors

![neighbors-cover](https://user-images.githubusercontent.com/87627363/149588856-705514d0-c06c-4c9a-845b-941c82c735fb.jpg)

![Screen Shot 2022-01-14 at 2 40 01 PM](https://user-images.githubusercontent.com/87627363/149588878-9a8e9e0d-3dec-4638-b8dd-458106c5ff8d.png)

## Project Description
The Neigh-bors application is designed to connect farms with volunteer rescuers to evacuate horses during natural disaster events. The app includes both a frontend repo (this repo) and a backend repo (found here: [Neigh-bors Backend Repo](https://github.com/PhiMed/neigh-bors-be). The frontend of this app has been deployed to Heroku at [Neigh-bors](https://neigh-bors-fe.herokuapp.com/).

## Shipping Changes
If you would like to make changes to this project, please contact the owner of this repository via GitHub.

## Setup
This project was developed via Ruby 2.7.2, on Rails 5.2.6.It incorporates Circle CI and Google OAuth.

To access the dev environment for this app please follow these steps:
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
  * `bundle`
  * `bundle exec figaro install`
* Request API keys from MapQuest and Twilio. Add these to the application.yml file. This app also uses Google Oauth, so you will need to add the client id and secret.  

You can access the test suite (includes use of Capybara, Webmock, RSpec, Shouldamatchers, and Pry) via `bundle exec rspec`.

You can run the development server with `rails s` to see the app in action. To access localhost functionality, be sure to replace the Heroku URL in the conn methods in the FarmService, MissionService, and UserService to http://localhost:3000/api/v1. Please be aware that the development server for the frontend is localhost:5000. You will need to run both the backend server and frontend server at the same time to view this app in localhost.

## Contributors
This project was developed via Ruby on Rails by Philip Medlin, Chloe Price, Luis Arroyo, Lesley Sanders, and Didi Dodson at Turing School of Software and Design in 2022.
