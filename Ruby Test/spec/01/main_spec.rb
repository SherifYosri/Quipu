require_relative '../../01/main'

describe Main do
	describe "solve" do
		context "Given empty numbers array" do
			it "returns nil" do
				main = Main.new
				main.instance_variable_set(:@numbers, [])
				
				expect(main.solve).to eq(nil)
			end
		end

		context "Given non empty numbers array but without 2 numbers that summed up to 2020" do
			it "returns nil" do
				main = Main.new
				main.instance_variable_set(:@numbers, [1, 2, 3])
				
				expect(main.solve).to eq(nil)
			end
		end

		context "Given the input file of Advent Code" do
			it "returns 806656" do
				main = Main.new
				
				expect(main.solve).to eq(806656)
			end
		end

		context "Given array of 2 numbers that summing up to 2020" do
			it "returns the 2 numbers multiplication" do
				main = Main.new
				numbers = [1, 2019]
				main.instance_variable_set(:@numbers, numbers)
								
				cumulative_multiplication = 1
				numbers.each { |num| cumulative_multiplication *= num }

				expect(main.solve).to eq(2019)
			end
		end
	end
end