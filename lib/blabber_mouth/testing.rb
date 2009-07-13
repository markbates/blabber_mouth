if configatron.blabber_mouth.env == "test"
  
  # Used for testing this method will return any emails that have been 'sent' using BlabberMouth::DeliveryHandlers::Test.
  # These emails will get 'flushed' after each test.
  def delivered_notifiers
    BlabberMouth::DeliveryHandlers::Test::NotifierRegistry.registered_items
  end
  
  if defined?(Spec)

    Spec::Runner.configure do |config|

      config.before(:each) do
        BlabberMouth::DeliveryHandlers::Test::NotifierRegistry.reset!
      end

      config.after(:each) do
        BlabberMouth::DeliveryHandlers::Test::NotifierRegistry.reset!
      end

    end
    
  else
  
    module Test # :nodoc:
      module Unit # :nodoc:
        class TestCase # :nodoc:

          # Let's alias the run method in the class above us so we can create a new one here
          # but still reference it.
          alias_instance_method :run, :super_run

          # We need to wrap the run method so we can do things like
          # run a cleanup method if it exists
          def run(result, &progress_block) # :nodoc:
            @__res = super_run(result)
            BlabberMouth::DeliveryHandlers::Test::NotifierRegistry.reset!
            @__res
          end

        end # TestCase
      end # Unit
    end # Test
    
  end
  
end