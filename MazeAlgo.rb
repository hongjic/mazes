class MazeAlgo

	@d = [[-1,0],[1,0],[0,-1],[0,1]]

	class<<self
		attr_accessor :d
	end

	def initialize maze, h, w
		@maze = maze
		@h = h
		@w = w
	end

	def exist? begX, begY, endX, endY
		# use dfs and memorize search
		# return true or false
		visited = visited_initialize
		return dfs(begX, begY, endX, endY, visited)
	end

	def path_to begX, begY, endX, endY
		# use bfs to find the shortest path 
		# return the shortest path as a array[length_of_path][2]
		visited = visited_initialize
		return bfs(begX, begY, endX, endY, visited)
	end

	def go_through? cell_x, cell_y, di, visited
		x = cell_x*2+1
		y = cell_y*2+1
		return @maze[x+MazeAlgo.d[di][0]][y+MazeAlgo.d[di][1]]=="0" && !visited[cell_x+MazeAlgo.d[di][0]][cell_y+MazeAlgo.d[di][1]]
	end

	def dfs begX, begY, endX, endY, visited
		# check if there is a wall in four directions
		visited[begX][begY] = true
		return true if (begX==endX and begY==endY)
		# search 4 directions
		4.times do |i| 
			if go_through?(begX, begY, i, visited) && dfs(begX+MazeAlgo.d[i][0], begY+MazeAlgo.d[i][1], endX, endY, visited)
				return true
			end
		end
		false
	end

	def bfs begX, begY, endX, endY, visited
		visited[begX][begY] = true
		# list is for saving the points(or cells) that has been already visited
		# push the begin cell into the list
		# last_cell[i] is for saving the index of the last cell on the path to list[i]
		# push -1 into last_cell cuz there is not previous cell to the begin cell
		list = [[begX, begY]] 
		last_cell = [-1] 
		head = 0
		while head<list.size() 
			break if list[head][0]==endX and list[head][1]==endY
			# add the next possible cells into the list
			4.times do |i|
				if go_through?(list[head][0], list[head][1], i, visited)
					visited[list[head][0]+MazeAlgo.d[i][0]][list[head][1]+MazeAlgo.d[i][1]] =true
					list.push [list[head][0]+MazeAlgo.d[i][0], list[head][1]+MazeAlgo.d[i][1]]
					last_cell.push head
				end
			end
			head += 1
		end
		return "no path" if head>=list.size()
		path = []
		while head!=-1
			path.unshift list[head]
			head = last_cell[head]
		end
		path
	end

	def visited_initialize
		visited = Array.new
		@h.times do 
			line = Array.new
			@w.times { line.push false}
			visited.push line
		end
		visited
	end
end