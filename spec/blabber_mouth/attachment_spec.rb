require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe BlabberMouth::Attachment do
  
  before(:all) do
    @my_file = File.join(File.dirname(__FILE__), "..", "fixtures", "mark-simpson.png")
  end
  
  describe "add_file" do
    
    it "should read in a file and set the file_name" do
      at = BlabberMouth::Attachment.new
      at.add_file(@my_file)
      at.body.should == File.read(@my_file)
      at.file_name.should == "mark-simpson.png"
    end
    
  end
  
  describe "add_io" do
    
    it "should read in the IO object" do
      at = BlabberMouth::Attachment.new
      at.add_io(File.open(@my_file))
      at.body.should == File.read(@my_file)
    end
    
  end
  
  describe "new" do
    
    it "should take a string and read call add_file" do
      at = BlabberMouth::Attachment.new(@my_file)
      at.body.should == File.read(@my_file)
      at.file_name.should == "mark-simpson.png"
    end
    
    it "should take an IO and call add_io" do
      at = BlabberMouth::Attachment.new(File.open(@my_file))
      at.body.should == File.read(@my_file)
    end
    
  end
  
end