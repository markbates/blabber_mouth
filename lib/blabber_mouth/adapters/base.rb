module BlabberMouth
  module Adapters # :nodoc:
    # All mail adapters need to extend this class.
    class Base
      
      # The origina BlabberMouth object passed in.
      attr_accessor :bm_notifier
      
      def initialize(mail) # :nodoc:
        self.bm_notifier = mail
      end
      
      # The transformed (ie, converted, object)
      def transformed(*args)
        raise NoMethodError.new('transformed')
      end
      
      # Convert the BlabberMouth object to the adapted object.
      def convert(*args)
        raise NoMethodError.new('convert')
      end
      
      # The RAW encoded String ready for delivery via SMTP, Sendmail, etc...
      def deliverable(*args)
        raise NoMethodError.new('deliverable')
      end
      
    end # Base
  end # Adapters
end # BlabberMouth