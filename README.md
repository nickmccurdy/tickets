# Tickets
[![Build Status](https://secure.travis-ci.org/nicolasmccurdy/tickets.png?branch=master)](http://travis-ci.org/nicolasmccurdy/tickets)
[![Dependency Status](https://gemnasium.com/thenickperson/tickets.png)](https://gemnasium.com/thenickperson/tickets) 
[![Code Climate](https://codeclimate.com/github/thenickperson/tickets.png)](https://codeclimate.com/github/thenickperson/tickets)

A simple web app that lets students in computer labs file help tickets for their
teachers to review.

## [Demo](http://tickets-demo.herokuapp.com/) (experimental)

## Installation

Please note that these instructions are for setting up and running an instance of Tickets in the development environment, and not for deploying it. Tickets is designed to be deployed to Heroku.

1. Make sure you have Ruby 1.9.3, RubyGems, and Git installed and up to date with your package manager of choice. Alternatively, download the [Rails Installer](http://railsinstaller.org/) (Windows/Mac only) and follow the first two numbered bullets of step 2 from their website.

2. In your terminal, run:
```shell
git clone https://github.com/thenickperson/tickets.git
cd tickets
bundle install
rake db:setup
rails server
```
If execjs gives you a `Could not find a JavaScript runtime` error, try installing [Node.js](http://nodejs.org/).

3. Visit `http://localhost:3000/` in your web browser to start using your instance of Tickets.

## Requirements

### Tickets
- Tickets are stored in a persistent database, which does not need to store any other data
- Tickets are destroyed when they are resolved, and cannot be modified
- Tickets have the following attributes, which are all required to be existent and non-empty:
  - __name__ (string): the name of the person who created the ticket
  - __computer__ (integer, unique): the number of the computer that the ticket was created for
  - __reason__ (string): the reason for the ticket, chosen via two submit buttons (reason must be either "help" or "lab completed")
  - __created_at__ (time): the time the ticket was created

### Permissions
- Any user can see/create/destroy their own tickets
- There may only be one ticket open per computer (as a result, there should be only one ticket open per user)
- Authentication is required for the ticket list page, which lets admins see and destroy all tickets
- The username and password of the admin account are specified via a config file

### UI
- Two main views
  - New ticket (all users)
  - Ticket list (admin only)
- Let users know their positions on the queue
- Remember data about users between page visits
- Update both views with live data via AJAX so that HTTP requests are only required when switching pages and creating/destroying tickets
- Provide documentation for server maintainers and admins
