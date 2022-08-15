class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = alphabet.sample(10)
  end

  def score
    @words = params[:word].upcase
    @letters = params[:letters]
  end

  def word_in_grid(word, grid)
    word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
  end

  def english_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{words}"
    user_serialized = URI.open(url).read
    result = JSON.parse(user_serialized)
    result[:found]
  end
end
