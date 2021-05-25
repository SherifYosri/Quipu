class Main2
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
    validated_passports_fields = @required_passports_fields.clone
    valid_passports = 0

    @passports_fields.each{ |passport_field|
      if passport_field.empty?
        valid_passports += 1 unless validated_passports_fields.values.any?(false)
        validated_passports_fields = @required_passports_fields.clone
      else
        fields = passport_field.split(" ")
        fields.each{ |field|
          field_str = field.split(":")[0]
          validated_passports_fields[field_str.to_sym] = valid_passport_fields?(field)
        }
      end
    }
    valid_passports += 1 unless validated_passports_fields.values.any?(false)

    return valid_passports
  end

  private
    def valid_passport_fields?(field)
      key = field.split(":").first
      val = field.split(":").last
      valid = false

      case key
      when "byr"
        valid = true if val.size == 4 && val.to_i >= 1920 && val.to_i <= 2002
      when "iyr"
        valid = true if val.size == 4 && val.to_i >= 2010 && val.to_i <= 2020
      when "eyr"
        valid = true if val.size == 4 && val.to_i >= 2020 && val.to_i <= 2030
      when "hgt"
        if val.size == 4 && val[2..3] == "in"
          valid = true if val[0..1].to_i >= 59 && val[0..1].to_i <= 76
        elsif val.size == 5 && val[3..4] == "cm"
          valid = true if val[0..2].to_i >= 150 && val[0..2].to_i <= 193
        end
      when "hcl"
        valid = true if val.size == 7 && !val[1..6][/\H/]
      when "ecl"
        valid = true if %w(val amb blu brn gry grn hzl oth).include? val
      when "pid"
        valid = true if val.size == 9 && val !~ /\D/
      when "cid"
        valid = true
      end

      return valid
    end
end