require_relative 'test_helper'

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