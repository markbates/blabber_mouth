require 'configatron'
require 'genosaurus'
require 'validatable'
require 'tmail'
require 'xmpp4r'
require 'xmpp4r-simple'
require 'activesupport'

fl = File.join(File.dirname(__FILE__), "blabber_mouth")

require File.join(fl, "settings")
require File.join(fl, "errors")
require File.join(fl, "attachment")
require File.join(fl, "notifier_generator", "notifier_generator")

[:utils, :delivery_handlers, :adapters, :rendering].each do |dir|
  Dir.glob(File.join(fl, dir.to_s, "**/*.rb")).each do |h|
    require h
  end
end

require File.join(fl, "notifier")

require File.join(fl, "validations")

require File.join(fl, "testing")

require File.join(fl, "loader")
