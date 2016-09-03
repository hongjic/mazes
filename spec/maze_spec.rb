require 'rspec'
require_relative '../Maze'

maze_table = {
	maze1: "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
}

describe 'Maze' do
	
	before {
		@maze = Maze.new
		@maze.load(maze_table[:maze1], 4, 4)
	}

	it "should load maze correctly" do
		expect(@maze.maze).to eq [["1", "1", "1", "1", "1", "1", "1", "1", "1"], 
								["1", "0", "0", "0", "1", "0", "0", "0", "1"], 
								["1", "1", "1", "0", "1", "0", "1", "0", "1"], 
								["1", "0", "0", "0", "1", "0", "1", "0", "1"], 
								["1", "0", "1", "1", "1", "0", "1", "0", "1"], 
								["1", "0", "0", "0", "0", "0", "1", "0", "1"], 
								["1", "1", "1", "0", "1", "1", "1", "0", "1"], 
								["1", "0", "0", "0", "0", "0", "1", "0", "1"], 
								["1", "1", "1", "1", "1", "1", "1", "1", "1"]]
	end

	it "should check boundary correctly" do
		expect(@maze.check_boundary(0,0,4,4)).to eq "Wrong end coordinator."
		expect(@maze.check_boundary(-1,-1,3,3)).to eq "Wrong begin coordinator."
		expect(@maze.check_boundary(0,0,3,3)).to be true
	end

	it "should display maze correctly" do
		expect(@maze.display).to eq "+-+-+-+-+\n|   |   |\n+-+ + + +\n|   | | |\n+ +-+ + +\n|     | |\n+-+ +-+ +\n|     | |\n+-+-+-+-+\n"
	end

	it "should redesign maze correctly" do
		@maze.redesign
		puts
		puts @maze.display
	end

	it "should solve correctly" do
		expect(@maze.solve(0,0,3,3)).to be true
		expect(@maze.solve(0,0,4,4)).to eq "Wrong end coordinator."
	end

end