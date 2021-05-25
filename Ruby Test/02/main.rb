class Main
  require_relative '../input_file_reader'
  require_relative 'password_policies_parser'

  include InputFileReader
  include PasswordPoliciesParser
  
  def initialize
    input_file_location = File.expand_path("input.txt", __dir__)
    @passwords_policies = read_input(input_file_location)
  end

  def solve
    valid_passwords = 0
    @passwords_policies.each { |password_policy|
      parsed_policy = parse_password_policy(password_policy)
      letter_occurrence = parsed_policy[:password].count(parsed_policy[:letter])
      
      if letter_occurrence >= parsed_policy[:range_lower_bound] && 
           letter_occurrence <= parsed_policy[:range_upper_bound]
        valid_passwords += 1
      end
    }

    return valid_passwords
  end
end