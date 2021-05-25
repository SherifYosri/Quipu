class Main
  require_relative '../input_file_reader'
  include InputFileReader
  
  def initialize
    input_file_location = File.expand_path("input.txt", __dir__)
    @passports_fields = read_input(input_file_location)
    @required_passports_fields = {
      byr: false,
      iyr: false,
      eyr: false, 
      hgt: false, 
      hcl: false, 
      ecl: false, 
      pid: false
    }
  end

  def solve
    found_passports_fields = @required_passports_fields.clone
    valid_passports = 0

    @passports_fields.each{ |passport_field|
      if passport_field.empty?
        valid_passports += 1 unless found_passports_fields.values.any?(false)
        found_passports_fields = @required_passports_fields.clone
      else
        fields = passport_field.split(" ")
        fields.each{ |field|
          field_str = field.split(":")[0]
          found_passports_fields[field_str.to_sym] = true
        }
      end
    }
    valid_passports += 1 unless found_passports_fields.values.any?(false)
    
    return valid_passports
  end
end