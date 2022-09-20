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
  gem 'ffi'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end
```

Install all gems `bundle install`

Set up RSpec in your app and create the Spec folder `rails g rspec:install`

Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`

Run all tests with description `rspec spec --format documentation`

## 👤 Author

### Mike Martínez

- GitHub: [@mikemtzp](https://github.com/mikemtzp)
- Twitter: [@mikemtzp](https://twitter.com/mikemtzp)
- LinkedIn: [Mike Martínez](https://www.linkedin.com/in/mike-mart%C3%ADnez/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/mikemtzp/Blog_app/issues).

## ⭐️ Show your support

Give a ⭐️ if you like this project!

## 📝 License

[MIT License](https://github.com/mikemtzp/Blog_app/blob/dev/LICENSE)
