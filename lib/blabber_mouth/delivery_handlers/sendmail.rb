module BlabberMouth
  module DeliveryHandlers # :nodoc:
    # Delivers BlabberMouth objects using sendmail.
    module Sendmail
      
      def self.deliver(mail)
        sendmail_settings = configatron.blabber_mouth.sendmail
        sendmail_args = sendmail_settings.arguments
        sendmail_args += " -f \"#{mail.reply_to}\"" if mail.reply_to
        IO.popen("#{sendmail_settings.location} #{sendmail_args}","w+") do |sm|
          sm.print(mail.deliverable.gsub(/\r/, ''))
          sm.flush
        end
      end
      
    end # Sendmail
    
  end # DeliveryHandlers
end # BlabberMouth