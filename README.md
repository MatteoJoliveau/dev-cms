# DevCMS

DevCMS is my personal Content Management System.
It powers my website at https://matteojoliveau.com and was
built around my needs.

It features two base concepts: Projects and Jobs.

### Projects  
Projects are basically portfolio entries. 
In my case they are open source projects I started or contributed
to, or work projects I worked on.

### Jobs
Jobs are resume entries. They are positions at companies I worked at.
They are aligned in a timeline for better presentation.

### Copies
Static pages like `/about` and `/contacts` are customized via 
copies. These two should already be present if db seeding was run
and can be customized in the admin panel.

### Dynamic configuration
Some elements are configured via `Config` objects. They are key-value
pairs used for things like author name and copyright year.
Necessary ones will be created during seeding, but more can be added at will.

## Technical Requirements

* Ruby 2.5

* Rails 5.2

* PostgreSQL 10.4

* Bundler 1.16

* NPM or Yarn for frontend dependencies

Classic Rails setup.

0. If using Docker, start Postgres with `docker-compose up -d`. 
Also install dependencies by running `bundle install` and `yarn install`. 
1. Create and seed DB with `rails db:setup` (if not using Docker) or
`rails db:migrate db:seed` (if using Docker)
2. Run server with `rails server`

Website will be served over at https://localhost:3000.  
Admin panel is at https://localhost:3000/admin. 
Username and password are printed during DB seeding.


## Tests
* Run tests with `rspec`.

