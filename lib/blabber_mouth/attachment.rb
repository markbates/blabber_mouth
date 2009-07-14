module BlabberMouth
  # Creates an attachment for a BlabberMouth object.
  class Attachment
    
    # Returns a String representing the body of the attachment. This String is NOT encoded in anyway!
    attr_accessor :body
    # Returns the name of the attached file.
    attr_accessor :file_name
    
    def initialize(body = nil)
      unless body.nil?
        self.add_file(body) if body.is_a?(String)
        self.add_io(body) if body.is_a?(IO)
      end
    end
    
    # Takes an IO object and sets the body. You'll need to explicity set the file_name afterwards.
    def add_io(io)
      self.body = io.read
    end
    
    # Takes a path to a file, reads it in, and sets the file_name based on the path.
    def add_file(file)
      self.file_name = File.basename(file)
      self.body = File.read(file)
    end
    
  end # Attachment
end # BlabberMouth