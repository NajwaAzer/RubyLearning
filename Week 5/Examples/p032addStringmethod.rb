puts "Methods: #{String.methods.grep /^wr/}"
class String  
  def write_size  
    self.size  
  end  
end  
size_writer = "Tell me my size!"  
puts size_writer.write_size 
puts "Methods: #{String.methods.grep /^wr/}"