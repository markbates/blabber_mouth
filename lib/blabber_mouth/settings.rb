if defined?(RAILS_ENV)
  configatron.blabber_mouth.set_default(:env, RAILS_ENV)
  configatron.blabber_mouth.paths.set_default(:models, File.join(RAILS_ROOT, 'app', 'notifiers'))
  configatron.blabber_mouth.paths.set_default(:templates, File.join(RAILS_ROOT, 'app', 'notifiers', 'templates'))
else
  configatron.blabber_mouth.set_default(:env, 'development')
  configatron.blabber_mouth.paths.set_default(:models, File.join(FileUtils.pwd, 'app', 'notifiers'))
  configatron.blabber_mouth.paths.set_default(:templates, File.join(FileUtils.pwd, 'app', 'notifiers', 'templates'))
end

configatron.blabber_mouth.paths.set_default(:templates, File.join(configatron.blabber_mouth.paths.models, 'templates'))

configatron.blabber_mouth.sendmail.set_default(:location, '/usr/sbin/sendmail')
configatron.blabber_mouth.sendmail.set_default(:arguments, '-i -t')
configatron.blabber_mouth.smtp.set_default(:address, 'localhost')
configatron.blabber_mouth.smtp.set_default(:port, 25)
configatron.blabber_mouth.smtp.set_default(:domain, 'localhost.localdomain')
configatron.blabber_mouth.set_default(:deliver_with, (configatron.blabber_mouth.env == "test" ? "test" : "smtp"))
configatron.blabber_mouth.set_default(:adapter, 'tmail')

# xmpp settings
configatron.blabber_mouth.xmpp.set_default(:jid, 'h_test@jabber80.com')
configatron.blabber_mouth.xmpp.set_default(:jid_resource, 'work')
configatron.blabber_mouth.xmpp.set_default(:password, 'test1234')
configatron.blabber_mouth.xmpp.set_default(:message_type, :chat)
configatron.blabber_mouth.xmpp.set_default(:wait_for_response, true)
configatron.blabber_mouth.xmpp.set_default(:response_wait_time, 20)
configatron.blabber_mouth.xmpp.set_default(:response_message, "ack")
