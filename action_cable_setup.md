### Setting up ActionCable
`NOTE:` If you generated your app using Rails 5 most of the following will be setup. Some of this info was gathered from [here](https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable) where you can read about how to setup redis and deployment.

1. In your Gemfile make sure to update your rails version:
```ruby
  gem 'rails', '>= 5.0.0'
```
1. You'll need to either uncomment or add Redis to your Gemfile. Redis is used as a data store for transient data, syncing content across instances of your application.
```ruby
  gem 'redis', '~> 3.0'
```
1. You'll also need to use Puma as your server since it is threaded. So add it to your Gemfile.
```ruby
gem 'puma'
```
1. `bundle install`
1. Create the following directory structure to handle our channels on the server side:
```
├── app
     ├── channels
         ├── application_cable
             ├── channel.rb
             └── connection.rb
```
1. `channel.rb` should contain:
```ruby
module ApplicationCable
     class Channel < ActionCable::Channel::Base
     end
end
```
1. `connection.rb` should contain:
```ruby
module ApplicationCable
     class Channel < ActionCable::Channel::Base
     end
end
```
1. Now we'll setup the client side of ActionCable. In `app/assets/javascripts/` create a `cable.js` file that contains:
```javascript
//= require action_cable
//= require_self
//= require_tree ./channels
(function() {
     this.App || (this.App = {});

     App.cable = ActionCable.createConsumer();
}).call(this);
```
1. Now add the following route to your routes file so consumers know where to connect:
```ruby
mount ActionCable.server => '/cable'
```
1. Finally add the following meta tag helper to the head of your application.html.erb file:
```html
<%= action_cable_meta_tag %>
```
