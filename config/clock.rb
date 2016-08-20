require 'clockwork'
require 'clockwork/database_events'
require_relative './boot'
require_relative './environment'

module Clockwork

  # required to enable database syncing support
  Clockwork.manager = DatabaseEvents::Manager.new

  sync_database_events model: ::Event, every: 1.minute do |event|
    event.job_name.constantize.perform_later(event.job_arguments)
  end

end