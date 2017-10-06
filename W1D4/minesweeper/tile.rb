class Tile

  attr_reader :is_bomb, :is_flagged, :revealed

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @is_flagged = false
    @revealed = false
  end

  def flag
    @is_flagged = true
  end

  def unflag
    @is_flagged = false
  end

  def reveal
    @revealed = true
  end



end
