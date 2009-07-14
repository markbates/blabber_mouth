require 'rubygems'
require 'spec'
require 'configatron'

configatron.blabber_mouth.env = 'test'
configatron.blabber_mouth.paths.models = File.join(File.dirname(__FILE__), 'fake_application', 'notifiers')
configatron.blabber_mouth.paths.templates = File.join(File.dirname(__FILE__), 'fake_application', 'notifiers', 'templates')

require File.join(File.dirname(__FILE__), '..', 'lib', 'blabber_mouth')

Spec::Runner.configure do |config|
  
  config.before(:all) do
    
  end
  
  config.after(:all) do
    
  end
  
  config.before(:each) do
    FileUtils.rm_rf(configatron.blabber_mouth.paths.models)
    FileUtils.rm_rf(configatron.blabber_mouth.paths.templates)
  end
  
  config.after(:each) do
    FileUtils.rm_rf(configatron.blabber_mouth.paths.models)
    FileUtils.rm_rf(configatron.blabber_mouth.paths.templates)
  end
  
end

class WelcomeEmail
  include BlabberMouth
end

def fixture(name)
  File.read(File.join(File.dirname(__FILE__), "fixtures", "#{name}.fixture"))
end

# Returns true/false if the current version of Ruby equals the specified version
def ruby?(v)
  RUBY_VERSION == v
end

def v1_8?
  RUBY_VERSION >= '1.8.0' && RUBY_VERSION < '1.9.0'
end

def v1_9?
  RUBY_VERSION >= '1.9.0' && RUBY_VERSION < '2.0.0'
end
