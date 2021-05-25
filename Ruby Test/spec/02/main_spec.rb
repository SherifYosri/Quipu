require_relative '../../02/main'

describe Main do
	describe "solve" do
		context "Given empty passwords array" do
			it "returns 0" do
				main = Main.new
				main.instance_variable_set(:@passwords_policies, [])
				
				expect(main.solve).to eq(0)
			end
		end

		context "Given non empty numbers array but without valid passwords" do
			it "returns 0" do
				main = Main.new
				main.instance_variable_set(:@passwords_policies, ["3-4 l: abcd"])
				
				expect(main.solve).to eq(0)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 447" do
				main = Main.new
				
				expect(main.solve).to eq(447)
			end
		end

		context "Given array of 2 elements that has only 1 valid password" do
			it "returns 1" do
				main = Main.new
				main.instance_variable_set(:@passwords_policies, ["3-4 l: abcd", "6-9 d: dddddkzdl"])

				expect(main.solve).to eq(1)
			end
		end
	end
end