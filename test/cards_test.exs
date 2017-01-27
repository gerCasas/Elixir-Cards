defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "pruebas_unitarias" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
    # tambien existe el comando refute que es lo inverso a assert
  end

end
