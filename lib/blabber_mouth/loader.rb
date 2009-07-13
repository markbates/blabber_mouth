# If the notifiers directory does not exist, create it.
path = configatron.blabber_mouth.paths.models
FileUtils.mkdir_p(path)

# Require all notifiers
Dir.glob(File.join(path, "**/*.rb")).each do |notifier|
  require File.expand_path(notifier)
end