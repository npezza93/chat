require "rails/generators/base"
require "rails/generators/active_record"
require "rails/generators/migration"

module Chat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "Adds view helpers, user methods, and migrations for chat"

      def check_user_table
        raise UsersTableNotImplemented unless users_table_exists?
      end

      def create_chat_initializer
        copy_file "chat.rb", "config/initializers/chat.rb"
      end

      def add_helper
        file = "app/controllers/application_controller.rb"
        after = "class ApplicationController < ActionController::Base\n"
        inject_into_file file, after: after do
          "  helper Chat::Engine.helpers\n"
        end
      end

      def inject_chat_into_user_model
        file = "app/models/user.rb"
        after = "class User < ApplicationRecord\n"
        inject_into_file file, after: after do
          "  include Chat::User\n"
        end
      end

      def add_chat_status_migration
        migration_template "add_chat_to_users.rb",
                           "db/migrate/add_chat_to_users.rb"
        migration_template "create_chat.rb", "db/migrate/create_chat.rb"
      end

      def add_chat_route
        route "mount Chat::Engine => \"/chat\", as: \"chat\""
      end

      class UsersTableNotImplemented < StandardError
        def initialize(msg = "User model not yet implemented")
          super
        end
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      private

      def users_table_exists?
        if ActiveRecord::Base.connection.respond_to?(:data_source_exists?)
          ActiveRecord::Base.connection.data_source_exists?(:users)
        else
          ActiveRecord::Base.connection.table_exists?(:users)
        end
      end
    end
  end
end
