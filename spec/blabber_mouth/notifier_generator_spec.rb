require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe NotifierGenerator do
  
  before(:each) do
    @notifier_file = File.join(configatron.blabber_mouth.paths.models, "registration_email.rb")
    @text_file = File.join(configatron.blabber_mouth.paths.templates, "registration_email", "plain.erb")
    @html_file = File.join(configatron.blabber_mouth.paths.templates, "registration_email", "html.erb")
  end
  
  it "should require a name" do
    lambda{NotifierGenerator.new}.should raise_error(ArgumentError)
  end
  
  it "should create a notifier class" do
    File.should_not be_exists(@notifier_file)
    NotifierGenerator.run("name" => "registration_email")
    File.should be_exists(@notifier_file)
    File.read(@notifier_file).should == fixture("registration_email.rb")
  end
  
  it "should create plain.erb and html.erb files" do
    File.should_not be_exists(@text_file)
    File.should_not be_exists(@html_file)
    NotifierGenerator.run("name" => "registration_email")
    File.should be_exists(@text_file)
    File.read(@text_file).should == fixture("plain.erb")
    File.should be_exists(@html_file)
    File.read(@html_file).should == fixture("html.erb")
  end
  
end