defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # basicamente un FOR EACH ELEMENT OF
    # --- SOLUCION #1 COMENTADA ---
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    #
    # List.flatten(cards)

    # --- SOLUCION #2 (MEJOR) ---
    # (multiple comprehensions en un mismo ciclo)
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  # metodo para hacer random el orden del arreglo
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # metodo para saber si un arreglo o lista contiene un elemento ...
  # (puede ser string o int o float).
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # metodo para dividir lista deck en la cantidad que diga hand_size.
  # Enum.split regresa un tuple, el primer elemento [0] es el hand y el ...
  # segundo elemento [1] del tuple es el resto del deck.
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

end
