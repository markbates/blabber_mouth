module BlabberMouth
  module Adapters # :nodoc:
    
    class XmppMsgContainer 
      attr_accessor :messages
      attr_accessor :recipients
      def initialize
        self.messages = []
        self.recipients = []
      end
      
      def find_message_by_recipient(rcpt)
        self.messages.find { |x| x.to.to_s == rcpt.to_s }
      end
      
    end
    
    # All mail adapters need to extend this class.
    class Xmpp < BlabberMouth::Adapters::Base
      include Jabber
      
      # The transformed (ie, converted, object)
      def transformed
        raise BlabberMouth::Errors::UnconvertedNotifier.new if @xmpp_msg.nil?
        return @xmpp_container
      end
      
      # Convert the BlabberMouth object to the adapted object.
      def convert
        settings = configatron.blabber_mouth.xmpp_settings
        arr = [bm_notifier.to].flatten
        @xmpp_container = XmppMsgContainer.new
        @xmpp_container.recipients = arr
        
        arr.each do |rcpt|
          xmpp_msg = Message::new
          xmpp_msg.set_type(:normal)
          xmpp_msg.set_to(rcpt)
          xmpp_msg.set_from(bm_notifier.from)
          xmpp_msg.set_subject(bm_notifier.subject)
          xmpp_msg.set_type(settings.message_type)
          unless bm_notifier.body(:plain).blank?
            xmpp_msg.set_body(bm_notifier.body(:plain))
          end

          @xmpp_container.messages << xmpp_msg
        end
        
        return @xmpp_container
      end
      
      # The RAW encoded String ready for delivery via SMTP, Sendmail, etc...
      def deliverable
        return @xmpp_container
      end
      
    end # Base
  end # Adapters
end # BlabberMouth