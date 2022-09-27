# Blog App
> The Blog app is a classic example of a blog website. It's a functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts. 

## 🛠️ Built With

- Ruby on Rails

## 🧮 Prerequisites

### Install
- Node.js
- Yarn
- Ruby
- Ruby on Rails

### Setup

Follow these steps on your console to properly clone this repository on your desktop:

```
$ cd desktop
$ git clone 'repo_path'
$ cd 'repo_name'
$ code .
Run 'ruby file_name' to see outputs in the console.
Run 'rubocop' to check linter offenses.
```

Create database for the project with `bin/rails db:create`, otherwise create databases manually in PostgreSQL.

If necessary, add username and password in `config/database.yml` for development and test:
```
development:
  <<: *default
  database: Blog_app_development
  host: ''
  username:
  password:
  
  test:
  <<: *default
  database: Blog_app_test
  username:
  password:
```

Add the following gems into your `Gemfile` development and test groups:

```
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "database_cleaner"
  gem 'ffi'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end
```

```
group :development do
  gem "web-console"
  gem 'bullet'
end
```

```
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
```

Install all gems `bundle install`

Set up bullet gem by running: `bundle exec rails g bullet:install`

Set up RSpec in your app and create the Spec folder `rails g rspec:install`

Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`

To see all tests with description run `rspec spec --format documentation`

#### Capybara

- Make sure to add `require "capybara/rspec"` in your `spec/rails_helper` file:

```
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rspec"
...
end
```

## 👤 Author

### Mike Martínez

- GitHub: [@mikemtzp](https://github.com/mikemtzp)
- Twitter: [@mikemtzp](https://twitter.com/mikemtzp)
- LinkedIn: [Mike Martínez](https://www.linkedin.com/in/mike-mart%C3%ADnez/)

### Dafne Azzolina

- GitHub: [@Daf98](https://github.com/Daf98)
- Twitter: [@dafne_azzolina](https://twitter.com/dafne_azzolina)
- LinkedIn: [dafne-azzolina](https://www.linkedin.com/in/dafne-azzolina/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/mikemtzp/Blog_app/issues).

## ⭐️ Show your support

Give a ⭐️ if you like this project!

## 📝 License

[MIT License](https://github.com/mikemtzp/Blog_app/blob/dev/LICENSE)
