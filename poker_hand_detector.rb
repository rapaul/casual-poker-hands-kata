class Hand
  attr_reader :rank

  def initialize rank
    @rank = rank
  end

  def beats other_hand
    true
  end
end

class PokerHandDetector
  def detect(cards)
    number_of_unique_cards = cards.uniq.size

    rank = case
    when number_of_unique_cards < 3
      full_house?(cards) ? :full_house : :four_of_a_kind
    when number_of_unique_cards < 4
      :three_of_a_kind
    when number_of_unique_cards < 5
      :pair
    else
      :high_card
    end
    Hand.new(rank)
  end

  def full_house? cards
    unique_cards = cards.uniq
    cards.count(unique_cards[0]) > 1 && cards.count(unique_cards[1]) > 1
  end
end
