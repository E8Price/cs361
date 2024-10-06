class Player
  attr_accessor :name, :score

  def initialize(name, score)
    @name = name
    @score = score
  end

  def to_s
    "Ready #{@name}! Score: #{@score}"
  end
end

#create an array of 50 Player objects with random score
players = []
50.times do |i|
  player_name = "Player #{i + 1}"
  player_score = rand(10..300)
  players << Player.new(player_name, player_score)
end

# print each players information
players.each do |player|
  puts player
end
