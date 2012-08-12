require 'set'
puts "Magic: The Gathering emulator"

# TODO
# * Steal all cards from magic website for CardReader
# * Deck has many cards
# * Card
#   * Title
#   * Mana cost
#   * Colors
#   * Type (instant, creature, ...)
#   * Power / Toughness for creatures

class Card
  COLORS = ["Black", "White", "Red", "Blue", "Green", "Colorless"]

  attr_accessor :title, :cost
  
  def initialize(card_string = '')
    card_values = card_string.split("\n")

    self.title = card_values.first
    self.cost  = card_values[1] unless card_values[1] == ''
  end

  def color
    # 1. Keep only letters in cost
    # 2. Loop through those letter
    # 3. Loop through each color
    # 4. Compare first letter of color with current_letter
    # 5. If match, put color into result array
    colors = cost.to_s.split(/[0-9]/)
    colors = colors.reject do |color|
      color.empty? || color == 'Colorless'
    end

    colors = Set.new(colors)

    case colors.size
    when 1
      colors.first
    when 0
      'Colorless'
    else
      colors
    end
  end

end