require_relative '../../01/main2'

describe Main2 do
	describe "solve" do
		context "Given empty numbers array" do
			it "returns nil" do
				main2 = Main2.new
				main2.instance_variable_set(:@numbers, [])
				
				expect(main2.solve).to eq(nil)
			end
		end

		context "Given non empty numbers array but without 3 numbers that summed up to 2020" do
			it "returns nil" do
				main2 = Main2.new
				main2.instance_variable_set(:@numbers, [1, 2, 3])
				
				expect(main2.solve).to eq(nil)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 230608320 " do
				main2 = Main2.new
				
				expect(main2.solve).to eq(230608320)
			end
		end

		context "Given array of 3 numbers that summing up to 2020" do
			it "returns the 3 numbers multiplication" do
				main2 = Main2.new
				numbers = [1, 2, 2017]
				main2.instance_variable_set(:@numbers, numbers)
				
				cumulative_multiplication = 1
				numbers.each { |num| cumulative_multiplication *= num }

				expect(main2.solve).to eq(cumulative_multiplication)
			end
		end
	end
end