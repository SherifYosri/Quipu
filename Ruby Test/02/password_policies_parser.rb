module PasswordPoliciesParser
	def parse_password_policy(password_policy)
    arr = password_policy.split(" ")
    appear_times = arr[0].split("-")
    
    {
      range_lower_bound: appear_times.first.to_i,
      range_upper_bound: appear_times.last.to_i,
      letter: arr[1].delete(":"),
      password: arr[2]
    }
  end
end