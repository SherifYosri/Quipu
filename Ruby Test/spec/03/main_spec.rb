require_relative '../../03/main'

describe Main do
	describe "solve" do
		context "Given empty passports array" do
			it "returns 0" do
				main = Main.new
				main.instance_variable_set(:@passports_fields, [])
				
				expect(main.solve).to eq(0)
			end
		end

		context "Given non empty numbers array but without valid passports" do
			it "returns 0" do
				main = Main.new
				main.instance_variable_set(:@passports_fields, ["pid:526669252 eyr:1972"])
				
				expect(main.solve).to eq(0)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 230" do
				main = Main.new
				
				expect(main.solve).to eq(230)
			end
		end

		context "Given array of 2 elements that has only 1 valid passport" do
			it "returns 1" do
				main = Main.new
				passports = [
					"hgt:176cm\niyr:2013\nhcl:#fffffd ecl:amb\nbyr:2000\neyr:2034\ncid:89 pid:934693255", 
					"byr:1939\neyr:2020"
				]
				main.instance_variable_set(:@passports_fields, passports)

				expect(main.solve).to eq(1)
			end

			it "treats cid as optional passports field" do
				main = Main.new
				passports = [
					"hgt:176cm\niyr:2013\nhcl:#fffffd ecl:amb\nbyr:2000\neyr:2034\npid:934693255", 
					"byr:1939\neyr:2020"
				]
				main.instance_variable_set(:@passports_fields, passports)

				expect(main.solve).to eq(1)
			end
		end
	end
end