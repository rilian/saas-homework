class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def win?(player1, player2)
  player1.upcase!
  player2.upcase!
  strat = ['R', 'P', 'S']
  raise NoSuchStrategyError unless strat.include?(player1) && strat.include?(player2)

  !['RP', 'PS', 'SR'].include?(player1 + player2)
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  win?(game[0][1], game[1][1]) ? game[1] : game[0]
end

def rps_tournament_winner(game)
  game[0][0].is_a?(String) ? rps_game_winner(game) : rps_game_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
end