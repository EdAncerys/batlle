class Game

  attr_reader :player_1, :player_2, :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player =  @player_1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end
  
  def self.instance
    @game
  end
  
end
