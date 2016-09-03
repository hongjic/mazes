require_relative 'Maze'
maze_table = {
	maze1: "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
}


maze = Maze.new
maze.load(maze_table[:maze1], 4, 4)
maze.display