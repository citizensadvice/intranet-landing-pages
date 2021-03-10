# Citizens Advice Intranet
Static site generated landing page for the digital workplace.

## Installation
Dependencies: Ruby 2.7, Bundler, and Node.js

- Install Ruby dependencies via `bundle install`
- Install Node.js dependencies via `npm install`

## Usage

To run a development server, use:

```
bundle exec middleman server
```

To build for production, use:

```
bundle exec middleman build
```

Both of these commands will run the equivalent Node.js commands, as specified
in the `external_pipeline` section of [`config.rb`](config.rb).
