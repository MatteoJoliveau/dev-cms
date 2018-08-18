# DevCMS

DevCMS is my personal Content Management System.
It powers my website at https://matteojoliveau.com and was
built around my needs.

It features three base concepts: Projects, Jobs and Pages.

### Projects  
Projects are basically portfolio entries. 
In my case they are open source projects I started or contributed
to, or work projects I worked on.

### Jobs
Jobs are resume entries. They are positions at companies I worked at.
They are aligned in a timeline for better presentation.

### Pages
Static pages like `/about` and `/contacts` can be created at runtime.
They have a name, a path and a template, which is defined using [Liquid language](https://shopify.github.io/liquid/).
By default templates have access to all [Bulma](https://bulma.io) CSS classes and two special objects:
- `projects`, a list of all published projects
- `jobs`, a list of all published jobs

Pages that are marked as `navbar: true` are automatically added to the navbar in the order defined
by `navbar_order`, with `1` being the last.

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

