# Chat

## Installation
---
`WARNING:` This gem relies on ActionCable. An authentication system must be setup before installing 'chat'. The generator will only run unless a users table exists.

---

Add this line to your application's Gemfile:

```ruby
gem 'chat'
```

And then execute:
```bash
$ bundle
```

Run the installer to setup migrations and helpers:
```bash
$ rails generate chat:install
```

After running the installer add the followings lines to your application.js and application.css files:

```javascript
//= require chat
```

```css
/*
 *= require chat
 */
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
