module InputFileReader
  def read_input(location)
  	begin
      file = File.open(location, 'r')
      file.readlines.map(&:chomp)
    rescue Errno::ENOENT
      puts 'Input file not found'
      []
    end
  end
end