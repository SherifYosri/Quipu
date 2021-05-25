require_relative '../../02/main2'

describe Main2 do
	describe "solve" do
		context "Given empty passwords array" do
			it "returns 0" do
				main2 = Main2.new
				main2.instance_variable_set(:@passwords_policies, [])
				
				expect(main2.solve).to eq(0)
			end
		end

		context "Given non empty numbers array but without valid passwords" do
			it "returns 0" do
				main2 = Main2.new
				main2.instance_variable_set(:@passwords_policies, ["3-4 l: abcd"])
				
				expect(main2.solve).to eq(0)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 447" do
				main2 = Main2.new
				
				expect(main2.solve).to eq(249)
			end
		end

		context "Given array of 2 elements that has only 1 valid password" do
			it "returns 1" do
				main2 = Main2.new
				main2.instance_variable_set(:@passwords_policies, ["3-4 l: abcd", "1-2 d: d"])

				expect(main2.solve).to eq(1)
			end
		end
	end
end