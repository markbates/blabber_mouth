require File.join(File.dirname(__FILE__), "base")
require 'base64'

module BlabberMouth
  module Adapters # :nodoc:
    # Converts a BlabberMouth object into a TMail object.
    class Tmail < BlabberMouth::Adapters::Base
      
      # Returns the underlying TMail object.
      # Raises BlabberMouth::Errors::UnconvertedNotifier if the convert method hasn't
      # been called first.
      def transformed
        raise BlabberMouth::Errors::UnconvertedNotifier.new if @tmail.nil?
        @tmail
      end
      
      # Returns the ready to be delivered encoded String
      def deliverable
        transformed.encoded
      end
      
      # Converts the BlabberMouth object to a TMail object.
      def convert
        @tmail = TMail::Mail.new 
        @tmail.to =           bm_notifier.to
        @tmail.cc =           bm_notifier.cc
        @tmail.bcc =          bm_notifier.bcc
        @tmail.reply_to =     bm_notifier.reply_to
        @tmail.from =         bm_notifier.from
        @tmail.subject =      bm_notifier.subject
        @tmail.date =         bm_notifier.date_sent
        @tmail.mime_version = bm_notifier.mime_version

        # set text and html bodies
        main_body = TMail::Mail.new
        unless bm_notifier.body(:plain).blank?
          text = TMail::Mail.new
          text.content_type = "text/plain"
          text.body = bm_notifier.body(:plain)
          main_body.parts << text
        end
        unless bm_notifier.body(:html).blank?
          html = TMail::Mail.new
          html.content_type = "text/html"
          html.body = bm_notifier.body(:html)
          main_body.parts << html
        end

        unless main_body.parts.empty?
          main_body.content_type = "multipart/alternative"
          if bm_notifier.attachments.any? # there's an attachment
            @tmail.parts << main_body
          else
            if main_body.parts.size == 1
              @tmail.body = main_body.parts.first.body
            else
              @tmail.parts << main_body
            end
          end
        end

        # set attachments, if any.
        bm_notifier.attachments.each do |at|
          attachment = TMail::Mail.new
          attachment.body = Base64.encode64(at.body)
          attachment.transfer_encoding = "Base64"
          attachment.content_type = "application/octet-stream"
          attachment['Content-Disposition'] = "attachment; filename=#{at.file_name}"
          @tmail.parts << attachment
        end
        
        @tmail.content_type = bm_notifier.content_type
      end
      
    end # Tmail
  end # Adapters
end # BlabberMouth