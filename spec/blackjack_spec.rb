require_relative "../lib/card"
require_relative "../lib/deck"
require_relative "../lib/hand"
require_relative "../lib/game"

RSpec.describe Card do
  let (:card) { Card.new('7', 'spades') }
  it 'has a rank' do
    expect(card.rank).to eq('7')
  end

  it 'has a suit' do
    expect(card.suit).to eq('spades')
  end

  describe '#face_card?' do
    it 'is a face card' do
      card = Card.new('K', 'hearts')
      expect(card.face_card?).to eq(true)
    end

    it 'it is not a face card' do
      expect(card.face_card?).to eq(false)
    end

  end

  describe '#face_card_value' do
    it 'has a value of 10' do
      card = Card.new('K', 'hearts')
      expect(card.face_card_value).to eq(10)
    end
  end

  describe '#ace?' do
    it 'is an ace card' do
      card = Card.new('A', 'hearts')
      expect(card.ace?).to eq(true)
    end

    it 'is not an ace card' do
      expect(card.ace?).to eq(false)
    end

  end

  # describe "#ace_card_value" do
  #   it ''
  #
  # end


end

RSpec.describe Deck do

  let (:deck) { Deck.new }

  it 'has a collection' do
    expect(deck.collection)
  end

  it 'the collection has been shuffled' do
    expect(deck.collection.shuffle!)
  end

  describe '#draw!' do
    it 'dealt a card' do
      expect(deck.draw!)
    end
  end

end

RSpec.describe Hand do
  # let (:cards) { Card.new('7', 'spades') }
  let (:deck) { Deck.new }
  let (:hand) { Hand.new }

  describe '#initial_draw' do
    it 'has an initial draw of 2 cards' do
      expect(hand.initial_draw).to eq
    end
  end



end
