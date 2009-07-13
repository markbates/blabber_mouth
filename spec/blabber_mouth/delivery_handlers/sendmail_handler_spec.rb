require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe BlabberMouth::DeliveryHandlers::SendMail do
  
  describe "deliver" do
    
    it "should send the mail" do
      we = WelcomeEmail.new
      we.to = "totesting@mackframework.com"
      we.from = "fromtesting@mackframework.com"
      we.subject = "smtp handler test"
      we.body(:plain, "my plain text body")
      we.body(:html, "my <b>html</b> body")
      BlabberMouth::DeliveryHandlers::SendMail.deliver(we)
    end
    
  end
  
end