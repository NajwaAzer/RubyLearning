# Make use of the class Dir for the following -

# Display your current working directory.
puts "Current working directory is #{Dir.pwd}"

# Create a new directory tmp under your working directory.
Dir.mkdir('/tmp')
puts "Created a directory called tmp"

# Change your working directory to tmp
Dir.chdir('/tmp')
puts "Working directory is now #{Dir.pwd}"

# Go back to your original directory.
Dir.chdir('../')

# Delete the tmp directory.
Dir.delete('/tmp')