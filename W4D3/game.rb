class Game
  def initialize
    @board = Board.new
    @display = Display.new
    @players = { human = HumanPlayer.new, computer = ComputerPlayer.new } 
    @current_player = #symbol or player??? 
  
  end

  def play

  end

  def notify_players
  end

  def swap_turn!
  end
end