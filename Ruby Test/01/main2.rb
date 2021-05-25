class Main2
  require_relative '../input_file_reader'
  include InputFileReader

  def initialize
    input_file_location = File.expand_path("input.txt", __dir__)
    @numbers = read_input(input_file_location)
  end

  def solve
    target = 2020
    @numbers.each_with_index{ |num, index|
      num = num.to_i
      remaining = target - num
      two_entries_multiplication = solve_two_entries(remaining, index)
      
      return num * two_entries_multiplication if two_entries_multiplication
    }

    return nil
  end

  private
  
    def solve_two_entries(target, index_to_ignore)
      numbers_hash = {}

      @numbers.each_with_index{ |num, index|
        next if index_to_ignore == index
        
        num = num.to_i
        remaining = target - num
        
        if numbers_hash[remaining]
          return num * remaining
        else
          numbers_hash[num] = true
        end
      }

      return nil
    end
end