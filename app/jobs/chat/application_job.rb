# frozen_string_literal: true
module Chat
  class ApplicationJob < ActiveJob::Base
    queue_as :default
  end
end
