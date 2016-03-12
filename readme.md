# Graphiql-Rails [![Gem Version](https://badge.fury.io/rb/graphiql-rails.svg)](https://badge.fury.io/rb/graphiql-rails) [![Build Status](https://travis-ci.org/rmosolgo/graphiql-rails.svg)](https://travis-ci.org/rmosolgo/graphiql-rails)

Mount the [Graphiql IDE](https://github.com/graphql/graphiql) in Ruby on Rails.

![image](https://cloud.githubusercontent.com/assets/2231765/12101544/4779ed54-b303-11e5-918e-9f3d3e283170.png)

## Installation

Add to your Gemfile:

```ruby
gem "graphiql-rails"
```

## Usage

### Mount the Engine

Add the engine to `routes.rb`:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # ...
  if Rails.env.development?
    mount Graphiql::Rails::Engine, at: "/graphiql", graphql_path: "/your/endpoint"
  end
end
```

- `at:` is the path where Graphiql will be served. You can access Graphiql by visiting that path in your app.
- `graphql_path:` is the path to the GraphQL endpoint. Graphiql will send queries to this path.

### Configuration

You can override `Graphiql::Rails` configs in an initializer (eg, `config/initializers/graphiql.rb`). The configs are:

```ruby
# These are the default values:
Graphiql::Rails.config.query_params = false # if true, the GraphQL query string will be persisted the page's query params.
Graphiql::Rails.config.initial_query = Graphiql::Rails::WELCOME_MESSAGE # This string is presented to a new user
Graphiql::Rails.config.csrf = false # if true, CSRF token will added and sent along with POST request to the GraphQL endpoint
```

## To-do

- [ ] Automate the update process for Graphiql assets
