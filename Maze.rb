require_relative 'MazeAlgo'

class Maze
  attr_accessor :maze #[width = 2*@height_cell+1][height = 2*@width_cell+1]
  attr_accessor :height_cell
  attr_accessor :width_cell
  attr_accessor :height
  attr_accessor :width

  def load arg, height, width
    @height_cell = height
    @width_cell = width
    @maze = Array.new
    @height = 2*@height_cell+1
    @width = 2*@width_cell+1
    @height.times do |i|
      line = Array.new
      @width.times { |j| line.push(arg[i*@width+j]) }
      @maze.push(line)
    end
    @maze_algo = MazeAlgo.new(@maze, @height_cell, @width_cell)
  end

  def display_c i, j
    if @maze[i][j] == "1"
      return i.even? ? (j.even? ? "+" : "-") : "|"
    end
    " "
  end

  def display
    # display the maze
    str = ""
    @height.times do |i|
      @width.times { |j| str += display_c(i, j) }
      str+="\n"
    end
    str
  end

  def check_boundary begX, begY, endX, endY
    if begX<0 || begX>@height_cell-1 || begY<0 || begY>@width_cell-1 || endX<0 || endX>@height_cell-1 || endY<0 || endY>@width_cell-1
      return "Wrong coordinator."
    end
    true
  end

  def solve begX, begY, endX, endY
    check = check_boundary(begX, begY, endX, endY)
    return check if check!=true
    return @maze_algo.exist?(begX, begY, endX, endY)
  end

  def trace begX, begY, endX, endY
    check = check_boundary(begX, begY, endX, endY)
    return check if check!=true
    path = @maze_algo.path_to(begX, begY, endX, endY)
    str = "Path: "
    path.length.times do |i|
      str += "[" + path[i][0].to_s + "," + path[i][1].to_s + "]"
      str += " => " if i<path.length-1
    end
    str
  end

  def redesign
    # automatically redesign a new maze
    create_walls
    connet_walls
    "New Maze has been formed."
  end

  def create_walls
    i = 1
    while i<@height-1
      j = 1
      j = 2 if i.odd?
      while j<@width-1
        @maze[i][j] = rand(2).to_s
        j += 2
      end
      i += 1
    end
  end

  def connet_walls
    (@height_cell-1).times do |i|
      (@width_cell-1).times do |j|
        x = 2*i+2
        y = 2*j+2
        @maze[x][y] = "0"
        if (@maze[x+1][y]=="1" || @maze[x-1][y]=="1" || @maze[x][y+1]=="1" || @maze[x][y-1]=="1")
          @maze[x][y] = "1"
        end
      end
    end 
  end
end