# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require "chat/version"

Gem::Specification.new do |s|
  s.add_dependency "material_icons"
  s.add_dependency "paperclip"
  s.add_dependency "jquery-fileupload-rails"
  s.add_dependency "rails", "~> 5.1"
  s.add_dependency "coffee-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "giphy"
  s.add_dependency "sidekiq"

  s.name          = "chat"
  s.version       = Chat::VERSION
  s.authors       = ["npezza93"]
  s.email         = ["npezza93@gmail.com"]
  s.summary       = "A simple rails chat gem that leverages ActionCable"
  s.homepage      = "https://github.com/npezza93/chat"
  s.license       = "MIT"

  s.files =
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "haml"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "clearance"
  s.add_development_dependency "faker"
  s.add_development_dependency "puma"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "turbolinks"
end
