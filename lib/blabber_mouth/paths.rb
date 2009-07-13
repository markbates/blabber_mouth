module Paths
  
  # The path to the app/notifiers directory.
  def self.notifiers(*args)
    BlabberMouth::Paths.app("notifiers", args)
  end
  
  # The path to the app/notifiers/templates directory.
  def self.notifier_templates(*args)
    BlabberMouth::Paths.notifiers("templates", args)
  end
  
  # The path the test/notifiers directory
  def self.notifier_tests(*args)
    BlabberMouth::Paths.test("notifiers", args)
  end
  
end