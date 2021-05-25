require_relative '../../03/main2'

describe Main2 do
	describe "solve" do
		context "Given empty passports array" do
			it "returns 0" do
				main2 = Main2.new
				main2.instance_variable_set(:@passports_fields, [])
				
				expect(main2.solve).to eq(0)
			end
		end

		context "Given non empty numbers array but without valid passports" do
			it "returns 0" do
				main2 = Main2.new
				main2.instance_variable_set(:@passports_fields, ["pid:526669252 eyr:1972"])
				
				expect(main2.solve).to eq(0)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 156" do
				main2 = Main2.new
				
				expect(main2.solve).to eq(156)
			end
		end

		context "Given array of 2 elements that has only 1 valid passport" do
			it "returns 1" do
				main2 = Main2.new
				passports = [
					"hgt:176cm\niyr:2013\nhcl:#fffffd ecl:amb\nbyr:2000\neyr:2034\ncid:89 pid:934693255", 
					"byr:1939\neyr:2020"
				]
				main2.instance_variable_set(:@passports_fields, passports)

				expect(main2.solve).to eq(1)
			end

			it "treats cid as optional passports field" do
				main2 = Main2.new
				passports = [
					"hgt:176cm\niyr:2013\nhcl:#fffffd ecl:amb\nbyr:2000\neyr:2034\npid:934693255", 
					"byr:1939\neyr:2020"
				]
				main2.instance_variable_set(:@passports_fields, passports)

				expect(main2.solve).to eq(1)
			end
		end
	end
end