require 'rspec'
require_relative '../MazeAlgo'

maze_table = {
	maze1: [["1", "1", "1", "1", "1", "1", "1", "1", "1"],
			["1", "0", "0", "0", "1", "0", "0", "0", "1"],
			["1", "1", "1", "0", "1", "0", "1", "0", "1"],
			["1", "0", "0", "0", "1", "0", "1", "0", "1"],
			["1", "0", "1", "1", "1", "1", "1", "0", "1"],   #di 5 ge yingwei 0
			["1", "0", "0", "0", "0", "0", "1", "0", "1"],
			["1", "1", "1", "0", "1", "1", "1", "0", "1"],
			["1", "0", "0", "0", "0", "0", "1", "0", "1"],
			["1", "1", "1", "1", "1", "1", "1", "1", "1"]]
}

describe 'MazeAlgo' do
	
	before {
		@algo = MazeAlgo.new(maze_table[:maze1], 4, 4)
	}

	it "should initialize Matrix<visited> correctly" do
		expect(@algo.visited_initialize).to eq [[false, false, false, false],
												[false, false, false, false],
												[false, false, false, false],
												[false, false, false, false]]
	end

	it "should do method<exist?> correctly" do
		expect(@algo.exist?(0,0,3,3)).to be false
		expect(@algo.exist?(0,0,1,2)).to be false
		expect(@algo.exist?(3,2,3,3)).to be false
		expect(@algo.exist?(0,0,2,2)).to be true
		expect(@algo.exist?(3,0,2,2)).to be true
	end

	it "should do method<path_to> correctly" do
		expect(@algo.path_to(0,0,2,2)).to eq [[0,0],[0,1],[1,1],[1,0],[2,0],[2,1],[2,2]]
		expect(@algo.path_to(3,0,2,2)).to eq [[3,0],[3,1],[2,1],[2,2]]
	end
end