class Maze
attr_accessor :maze, :current_position, :nodes

  def initialize(maze = File.readlines("maze1.txt").map(&:chomp))
    @maze = maze
    @nodes = make_nodes(@maze)

  end


  def make_nodes(maze)
    result = []
    maze.each_with_index do |array,x|
      array.each_with_index do |char,y|
        if char == " "
          result << Node.new([x,y])
        end
      end
    end
      result
  end

end
