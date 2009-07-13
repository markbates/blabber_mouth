module BlabberMouth
  module DeliveryHandlers # :nodoc:
    # Delivers BlabberMouth objects to an Array.
    module Test
      
      def self.deliver(notifier)
        NotifierRegistry.add(notifier)
      end
      
      class NotifierRegistry < BlabberMouth::Utils::RegistryList # :nodoc:
      end
      
    end # Test
  end # DeliveryHandlers
end # BlabberMouth