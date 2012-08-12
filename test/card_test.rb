require_relative 'test_helper'

class CardTest < Test::Unit::TestCase
  def setup
    @land = Card.new
    @cards = CardReader.new("card_definitions.txt").cards
    @island      = @cards.first
    @serra_angel = @cards[1]
    @lava_axe    = @cards[2]
    @nicol_bolas = @cards[3]
    @ornithopter = @cards[4]
  end

  def test_can_store_a_title
    @land.title = "Island"

    assert_equal 'Island', @land.title
  end


  def test_color_is_derrived_from_cost
    assert_equal '2White3Colorless' , @serra_angel.cost 
    assert_equal 'White', @serra_angel.color

    assert_equal '1Red4Colorless', @lava_axe.cost
    assert_equal 'Red' , @lava_axe.color

    assert_nil @island.cost
    assert_equal 'Colorless' , @island.color 

    assert_equal "2Black1Red1Blue4Colorless", @nicol_bolas.cost
    assert_equal Set.new(["Red", "Black", "Blue"]), @nicol_bolas.color
    assert_equal Set.new(["Blue", "Black", "Red"]), @nicol_bolas.color

    assert_nil @ornithopter.cost
    assert_equal 'Colorless' , @ornithopter.color
  end
end


class CardReaderTest < Test::Unit::TestCase
  def setup
    @reader = CardReader.new("card_definitions.txt")    
  end

  def test_reads_list_of_cards_from_filename
    first_card  = @reader.cards.first
    second_card = @reader.cards[1]

    assert_instance_of Card, first_card

    assert_equal "Island", first_card.title
    assert_nil first_card.cost

    assert_equal "Serra Angel", second_card.title
  end
end