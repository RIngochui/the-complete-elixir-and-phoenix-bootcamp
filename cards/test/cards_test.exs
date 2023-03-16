defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "deck contains a 3 of diamonds" do
    deck = Cards.create_deck
    assert Cards.contains?(deck, "Three of Diamonds")
  end

  test "deck contains a 13 of squares" do
    deck = Cards.create_deck
    refute Cards.contains?(deck, "Thirteen of Squares")
  end

  test "hand contains the correct number of cards" do
    {hand, deck} = Cards.create_hand(13)
    assert length(hand) == 13
  end

  test "dealing a card from a hand returns the first card in hand" do
    {hand, deck} = Cards.create_hand(13)
    [first_card|_] = hand
    {[card], hand} = Cards.deal(hand, 1)
    assert card == first_card
  end

end
