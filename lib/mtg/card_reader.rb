class CardReader
  def initialize(filename)
    @raw_string = File.read(filename)
    @card_strings = @raw_string.split(/\n{4}/)
    @cards = []
    read_cards_from_string
  end

  def cards
    @cards
  end

  def read_cards_from_string
    @card_strings.each do |card_string|
      @cards << Card.new(card_string)
    end
  end
end