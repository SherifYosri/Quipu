class Main2
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
      letter_occurrences = 0
      lower_bound, upper_bound = parsed_policy[:range_lower_bound] - 1, parsed_policy[:range_upper_bound] - 1

      letter_occurrences += 1 if parsed_policy[:password][lower_bound] == parsed_policy[:letter]
      letter_occurrences += 1 if parsed_policy[:password][upper_bound] == parsed_policy[:letter]
      
			valid_passwords += 1 if letter_occurrences == 1
    }

    return valid_passwords
  end
end