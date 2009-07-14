require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe BlabberMouth do
  
  before(:each) do
    @we = WelcomeEmail.new
    @my_file = File.join(File.dirname(__FILE__), "..", "fixtures", "mark-simpson.png")
    FileUtils.rm_rf(configatron.blabber_mouth.paths.models)
    @welcome_email_template_path = File.join(configatron.blabber_mouth.paths.templates, 'welcome_email')
  end
  
  describe "deliver" do
    
    it "should surpress exceptions and return false if there are errors" do
      @we.deliver(:smtp).should == false
    end
    
  end
  
  describe "deliver!" do
    
    it "should raise exceptions if there are errors" do
      if ruby?('1.8.6')
        lambda{@we.deliver!(:smtp)}.should raise_error(ArgumentError)
      elsif ruby?('1.8.7')
        lambda{@we.deliver!(:smtp)}.should raise_error(Net::SMTPUnknownError)
      end
    end
    
  end
  
  describe "build" do
    
    it "should build an email based on the provided hash" do
      @we.build({:to => "mark@example.com", :subject => "hello world", :body_plain => "this is my text body"})
      @we.to.should == "mark@example.com"
      @we.subject.should == "hello world"
      @we.body(:plain).should == "this is my text body"
    end
    
  end
  
  describe "date_sent" do
    
    it "should return Time.now if no date_sent is specified" do
      @we.date_sent.to_s.should == Time.now.to_s
      @we.date_sent = 1.days.ago
      @we.date_sent.to_s.should == 1.days.ago.to_s
    end
    
  end
  
  describe "content_type" do
    
    it "should return text/plain if there's only a text body" do
      @we.body(:plain, "hello")
      @we.content_type.should == "text/plain"
    end
    
    it "should return text/html if there's only a html body" do
      @we.body(:html, "hello")
      @we.content_type.should == "text/html"
    end
    
    it "should return multipart/alternative if there's both a text and html body" do
      @we.body(:plain, "hello")
      @we.body(:plain).should == "hello"
      @we.body(:html, "hello")
      @we.content_type.should == "multipart/alternative"
    end
    
    it "should return multipart/mixed if there's an attachment" do
      @we.attach(BlabberMouth::Attachment.new(@my_file))
      @we.content_type.should == "multipart/mixed"
    end
    
  end
  
  describe "destinations" do
    
    it "should concat all recipients into an array" do
      @we.to = "mark@example.com"
      @we.cc = ["foo@example.com", "bar@example.com"]
      @we.bcc = "fubar@example.com"
      @we.recipients.should == ["mark@example.com", "foo@example.com", "bar@example.com", "fubar@example.com"]
    end
    
  end
  
  describe "reply_to" do
    
    it "should use 'from' if no reply_to is specified" do
      @we.from = "Mark Bates"
      @we.reply_to.should == @we.from
      @we.reply_to = "mark@example.com"
      @we.reply_to.should_not == @we.from
      @we.reply_to.should == "mark@example.com"
    end
    
  end
  
  describe "body(:plain)" do
    
    it "if no text_body it should load a *.text.erb file, if available" do
      FileUtils.mkdir_p(@welcome_email_template_path)
      text_file = File.join(@welcome_email_template_path, 'plain.erb')
      File.open(text_file, "w") do |f|
        f.puts "Hello <%= notifier.to_s %>"
      end
      @we.to = "mark@example.com"
      @we.body(:plain).should == "Hello mark@example.com\n"
    end
    
  end
  
  describe "body(:html)" do
    
    it "if no html_body it should load a *.html.erb file, if available" do
      FileUtils.mkdir_p(@welcome_email_template_path)
      html_file = File.join(@welcome_email_template_path, "html.erb")
      File.open(html_file, "w") do |f|
        f.puts "Hello <b><%= notifier.to_s %></b>"
      end
      @we.to = "mark@example.com"
      @we.body(:html).should == "Hello <b>mark@example.com</b>\n"
    end
    
  end
  
  describe "attach" do
    
    it "should raise an error if the parameter isn't a BlabberMouth::Attachment" do
      lambda{@we.attach(1)}.should raise_error(ArgumentError)
    end
    
  end
  
  describe "has_attachments?" do
    
    it "should return true if there are attachments" do
      @we.should_not be_has_attachments
      @we.attach(BlabberMouth::Attachment.new(@my_file))
      @we.should be_has_attachments
    end
    
    it "should return false if there aren't attachments" do
      @we.should_not be_has_attachments
    end
    
  end
  
  describe "attachments" do
    
    it "should return any attachments" do
      at = BlabberMouth::Attachment.new(@my_file)
      @we.attach(at)
      @we.attachments.size.should == 1
      @we.attachments.should include(at)
    end
    
  end
  
end