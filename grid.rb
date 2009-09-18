class Grid
  # Create a rows x columns grid
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @grid = Array.new(@rows) { Array.new(@columns) }
  end

  # Generate [row,column] pairs that will cover the grid with a walk that
  # doesn't return a pair until all pairs with a lower row or colum value have
  # already been returned. For a 3x3 grid, this might return points in the
  # order represented in the picture by a..i
  #
  #      abf
  #      ceg
  #      dhi
  #
  # Note that this is also a valid sequence:
  #
  #      abc
  #      def
  #      ghi
  def cover
    # TODO: return the order implied by the first example 
    @rows.times do |r|
      @columns.times do |c|
        yield r,c
      end
    end
  end
  def [](r)
    @grid[r]
  end
end
