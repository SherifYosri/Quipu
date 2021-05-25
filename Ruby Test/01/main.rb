class Main
  require_relative '../input_file_reader'
  include InputFileReader

  def initialize
    input_file_location = File.expand_path("input.txt", __dir__)
    @numbers = read_input(input_file_location)
  end

  def solve
    target = 2020
    numbers_hash = {}
    @numbers.each { |num|
      num = num.to_i
      remaining = target - num
      
      if numbers_hash[remaining]
        two_entries_multiplication = num * remaining
        return two_entries_multiplication
      else
        numbers_hash[num] = true
      end
    }

    return nil
  end
end