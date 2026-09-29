class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word

  def self.get_random_word
    require 'uri'
    require 'net/http'
    require 'json'

    # Cucumber stubs the legacy URL so tests never depend on the network.
    # The legacy deployment is no longer available for the running app.
    url = if ENV['RACK_ENV'] == 'test'
      'https://random-word-api.vercel.app/api'
    else
      'https://random-word-api.herokuapp.com/word'
    end

    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    raise "random word service returned HTTP #{response.code}" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body).first
  end
end
