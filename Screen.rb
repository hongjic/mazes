require_relative 'Maze'

class Screen	

	@maze_table = {
		default: "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
	}
	
	class<<self
		attr_accessor :maze_table
	end

	def initialize 
		@Maze = Maze.new
		@Maze.load(Screen.maze_table[:default], 4, 4)
	end

	def run
		puts "Wellcome to Maze."
		puts @Maze.display
		while true
			begin
				print ">"
				command = gets.chomp
				exit if command == "exit"
				puts @Maze.instance_eval(command)
			rescue
				puts "Command Wrong."
			end
		end
	end
end