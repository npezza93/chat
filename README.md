# Chat
Simple Rails chat plugin that allows users to talk to one or more people at a
time that leverages ActionCable.

## Getting Started

#### Prerequisites
1. This gem relies on ActionCable therefore Rails 5.0.0 is a minimum.
1. For help setting up ActionCable when coming from an older version of Rails, view
[this](https://github.com/npezza93/chat/wiki/Setting-up-ActionCable).
1. An authentication system must be setup before installing `chat`, like
Devise, Clearance, or your own custom solution. The generator will only run
unless a users table exists.
1. Chat assumes that a `current_user` view helper
method exists.
1. Your connection should be identified by `current_user`. You can learn
more about how to set this up by reading
[here](http://edgeguides.rubyonrails.org/action_cable_overview.html#server-side-components-connections).

#### Installation
Add Chat to your application's Gemfile:

```ruby
gem 'chat'
```

And then execute:
```bash
❯ bundle
```

Run the installer to setup migrations and helpers and then migrate:
```bash
❯ rails generate chat:install
❯ rails db:migrate
```

Require chat in your app/assets/javascripts/application.js file:

```js
//= require chat
```

Require chat in your app/assets/stylesheets/application.css file

```css
 *= require chat
```

Finally, add the following line to your application.html.erb file or any view file
you'd like Chat available from:
```erb
<%= render_chat %>
```

### Dot Commands

Dot commands behave differently than regular messages and begin with a dot(.).
The following commands are available:
  - .shrug followed by an optional message outputs a srugging emoticon
  - .gif following by a label fetches a random gif from giphy with the given label

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/npezza93/chat.

## License
The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
