class MyFile
  attr_reader :file

  def initialize(file_path)
    begin
      @file = File.new(file_path, 'rb')
    rescue  => e
      raise Exception.new("File was not found")
    end
  end

  def read_file
    IO.binread(file)
  end

  def binary_string
   read_file.unpack("B*")[0]
  end

  def count_zeroes
    binary_string.count("0")
  end

  def count_ones
    binary_string.count("1")
  end

  def output
    puts "found #{count_ones} bits set to 1"
    puts "found #{count_zeroes} bits set to 0"
  end
end
