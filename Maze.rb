class Maze
	attr_accessor :str
	attr_accessor :height_cell
	attr_accessor :width_cell

	def load arg, height, width
		@str = arg
		@height_cell = height
		@width_cell = width
	end

	def display
		height = @height_cell*2+1
		width = @width_cell*2+1
		# display the maze
		height.times do |i|
			width.times do |j|
				if @str[i*width+j]=="1"
					print('+') if i.even? and j.even?
					print('-') if i.even? and j.odd?
					print('|') if i.odd?
				else 
					print(' ')
				end
			end
			print "\n"
		end
	end

	def solve begX,begY,endX,endY
		puts "The X-coordinator of begin point is wrong." if begX<0 || begX>@height_cell-1 
		puts "The Y-coordinator of begin point is wrong." if begY<0 || begY>@width_cell-1
		puts "The X-coordinator of end point is wrong." if endX<0 || endX>@height_cell-1
		puts "The Y-coordinator of end point is wrong." if endY<0 || endY>@width_cell-1
		
		return false
	end

	def trace begX,begY,endX,endY
	end

	def redesign
		# automatically redesign a new maze
	end
end