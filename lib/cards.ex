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

  # metodo para guardar el deck, :erlang es usado para ejecutar funciones de erlang
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # metodo para cargar la info almacenada por parametro filename
  # Se usan CASES para evitar IF
  # Se usa Pattern Matching
  # :ok y :error son "atom"
  #File.read(filename) regresa un tuple, el primer elemento es el status de la operacion ...
  # y el segundo elemento es el binary del contenido que se tendra que convertir con :erlang.binary_to_term
  # _reason esta variable tiene un gion bajo para decir al compilador que estamos seguro que esa variable no sera usada realmente y por lo tanto el compilador no nos dara un warning para referise que esa variable esta declarada pero no esta siendo usada. Esta variable esta en codigo por que la necesitamos para acompletar el Pattern Matching del metodo File.read()

  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   case status do
  #     :ok ->
  #       :erlang.binary_to_term binary
  #     :error ->
  #       "That file does not exist"
  #   end
  # end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term binary
      {:error, _reason} ->
        "That file does not exist"
    end
  end

end
