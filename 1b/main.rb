class Bike
  #parent class for all types of bikes
end

class RedBicycle < Bike

  AMOUNT = 10

  # initializes the RedBicycle with height, weight, and color
  def initialize(height, weight, color)
    @height = height
    @weight = weight
    @color = color
  end
  #returns the color of the bike
  def color
    @color
  end
  # Returns the height of the bike
  def height
    @height
  end
  # reduces the weights of the bike by the constant amount
  def reduce_weight
    @weight -= AMOUNT
  end
end
