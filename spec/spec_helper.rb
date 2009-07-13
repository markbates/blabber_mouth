require 'rubygems'
require 'spec'
require 'configatron'

configatron.blabber_mouth.env = 'test'
configatron.blabber_mouth.paths.models = File.join(File.dirname(__FILE__), 'fake_application', 'notifiers')

require File.join(File.dirname(__FILE__), '..', 'lib', 'blabber_mouth')

Spec::Runner.configure do |config|
  
  config.before(:all) do
    
  end
  
  config.after(:all) do
    
  end
  
  config.before(:each) do
    
  end
  
  config.after(:each) do
    
  end
  
end

class WelcomeEmail
  include BlabberMouth
end

def fixture(name)
  File.read(File.join(File.dirname(__FILE__), "fixtures", "#{name}.fixture"))
end
