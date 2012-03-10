class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def lose?(mine, his)
  mine.upcase!; his.upcase!
  strategies = ['R', 'P', 'S']
  if(!strategies.include?(mine) or !strategies.include?(his))
    raise NoSuchStrategyError
  end

  ["RP", "PS", "SR"].include?(mine + his)
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  if(lose?(game[0][1], game[1][1]))
    game[1]
  else
    game[0]
  end
end

def rps_tournament_winner(game)
  if(game[0][0].kind_of?(String))
    rps_game_winner(game)
  else
    rps_game_winner [rps_tournament_winner(game[0]), rps_tournament_winner(game[1])]
  end
end