require './poker_hand_detector.rb'

describe PokerHandDetector do
  detector = PokerHandDetector.new

  it 'is High Card if dealt non sequential cards with no duplicates' do
    cards = [1, 3, 5, 7, 9]
    hand = detector.detect cards
    hand.rank.should == :high_card
  end

  it 'is a Pair if two cards match' do
    cards = [1, 1, 2, 3, 4]
    hand = detector.detect cards
    hand.rank.should == :pair
  end

  it 'is Three of a Kind if 3 cards match' do
    cards = [1, 1, 1, 2, 3]
    hand = detector.detect cards
    hand.rank.should == :three_of_a_kind
  end

  it 'is Four of a Kind if 4 cards match' do
    cards = [1, 1, 1, 1, 2]
    hand = detector.detect cards
    hand.rank.should == :four_of_a_kind
  end

  it 'is a Full House if 3 cards are one number and the remaining 2 cards are another number' do
    cards = [1, 1, 1, 2, 2]
    hand = detector.detect cards
    hand.rank.should == :full_house
  end

end

describe "when comparing hands" do
  describe 'a pair' do
    it "beats a high card" do
      high_card_hand = PokerHandDetector.new.detect [1, 2, 6, 5, 7]
      pair_hand = PokerHandDetector.new.detect [5, 5, 8, 9, 4]
      pair_hand.beats(high_card_hand).should be true
    end
  end
end
