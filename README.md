# Tickets [![Build Status](https://secure.travis-ci.org/thenickperson/tickets.png?branch=master)](http://travis-ci.org/thenickperson/tickets) [![Dependency Status](https://gemnasium.com/thenickperson/tickets.png)](https://gemnasium.com/thenickperson/tickets) [![Code Climate](https://codeclimate.com/github/thenickperson/tickets.png)](https://codeclimate.com/github/thenickperson/tickets)
A simple web app to manage support tickets from users.

## [Demo](http://tickets-demo.herokuapp.com/) (buggy)

## Installation

You will want to open up a terminal for this.

1. Make sure you have Ruby 1.9.3, RubyGems, and Git installed and up to date with your package manager of choice. Alternatively, download the [Rails Installer](http://railsinstaller.org/) (Windows/Mac only) and follow the first two numbered bullets of step 2 from their website.

2. Run `git clone https://github.com/thenickperson/tickets.git`.

3. Run `cd tickets`.

4. Run `bundle install`. This may require an admin password, which is normal. Congrats, you now have all the dependencies installed!

5. Run tests with `rake test`. The app should still work if a test fails, though some specific things may break.

6. Start up Rails with `rails server` and visit `http://localhost:3000/` in your web browser.

## Requirements

### Tickets (completed)
- Tickets are stored in a persistent database, which does not need to store any other data
- Tickets are destroyed when they are resolved, and cannot be modified
- Tickets have the following attributes, which are all required to be existant and non-empty
  - __name__ (string): the name of the person who created the ticket
  - __computer__ (integer, unique): the number of the computer that the ticket was created for
  - __reason__ (string): the reason for the ticket, chosen via two submit buttons (reason must be from a list of two valid strings)
  - __created_at__ (time): the time the ticket was created
  - __updated_at__ (time): the time the ticket was last updated

### Permissions
- Any user can list/create/destroy their own tickets
- There may only be one ticket open per computer
- Authentication is required for the view tickets page, which lets an admin list and destroy tickets
- Admin password is specified via a config file

### UI
- Two main views
  - Create ticket (all users)
  - View tickets (admin only)
- Let users know what their position is on the queue
- Remember data about the user between page visits
- Update both views with live data via AJAX so that HTTP requests are only required when switching pages or creating/destroying tickets
- Documentation exists for the server maintainers and admins
