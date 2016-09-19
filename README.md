# Chat
Simple Rails chat plugin that allows users to talk to one or more people at a time that leverages ActionCable.

## Getting Started
`WARNING:` This gem relies on ActionCable therefore Rails 5.0.0 is a minimum. For help setting up ActionCable when coming from an old version of Rails view [this](https://www.github.com/npezza93/chat/blob/master/action_cable_setup.md). Also, an authentication system must be setup before installing `chat`, like Devise, Clearance, or your own custom solution. The generator will only run unless a users table exists.

Add Chat to your application's Gemfile:

```ruby
gem 'chat'
```

And then execute:
```bash
❯ bundle
```

Run the installer to setup migrations and helpers:
```bash
❯ rails generate chat:install
```

Require chat in your app/assets/javascripts/application.js file:

```
//= require chat
```

Require chat in your app/assets/stylesheets/application.css file

```
 *= require chat
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
