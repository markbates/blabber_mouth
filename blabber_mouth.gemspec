# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{blabber_mouth}
  s.version = "0.1.0.20090714164111"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["markbates"]
  s.date = %q{2009-07-14}
  s.description = %q{blabber_mouth was developed by: markbates}
  s.email = %q{}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["lib/blabber_mouth/adapters/base.rb", "lib/blabber_mouth/adapters/tmail.rb", "lib/blabber_mouth/adapters/xmpp_msg.rb", "lib/blabber_mouth/attachment.rb", "lib/blabber_mouth/blabber_mouth.rb", "lib/blabber_mouth/delivery_handlers/sendmail.rb", "lib/blabber_mouth/delivery_handlers/smtp.rb", "lib/blabber_mouth/delivery_handlers/test.rb", "lib/blabber_mouth/delivery_handlers/xmpp_transport.rb", "lib/blabber_mouth/errors.rb", "lib/blabber_mouth/loader.rb", "lib/blabber_mouth/notifier_generator/manifest.yml", "lib/blabber_mouth/notifier_generator/notifier_generator.rb", "lib/blabber_mouth/notifier_generator/templates/app/notifiers/html.erb.template", "lib/blabber_mouth/notifier_generator/templates/app/notifiers/notifier.rb.template", "lib/blabber_mouth/notifier_generator/templates/app/notifiers/plain.erb.template", "lib/blabber_mouth/rendering/type/mailer.rb", "lib/blabber_mouth/settings.rb", "lib/blabber_mouth/testing.rb", "lib/blabber_mouth/utils/registry_list.rb", "lib/blabber_mouth/validations.rb", "lib/blabber_mouth.rb", "README", "LICENSE"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{magrathea}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{blabber_mouth}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tmail>, [">= 1.2.3.1"])
      s.add_runtime_dependency(%q<validatable>, [">= 1.6.7"])
      s.add_runtime_dependency(%q<xmpp4r>, ["= 0.4"])
      s.add_runtime_dependency(%q<xmpp4r-simple>, [">= 0.8.8"])
    else
      s.add_dependency(%q<tmail>, [">= 1.2.3.1"])
      s.add_dependency(%q<validatable>, [">= 1.6.7"])
      s.add_dependency(%q<xmpp4r>, ["= 0.4"])
      s.add_dependency(%q<xmpp4r-simple>, [">= 0.8.8"])
    end
  else
    s.add_dependency(%q<tmail>, [">= 1.2.3.1"])
    s.add_dependency(%q<validatable>, [">= 1.6.7"])
    s.add_dependency(%q<xmpp4r>, ["= 0.4"])
    s.add_dependency(%q<xmpp4r-simple>, [">= 0.8.8"])
  end
end
