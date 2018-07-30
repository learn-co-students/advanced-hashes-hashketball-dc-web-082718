# Write your code here!
require 'pry'

def game_hash()
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
          "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
          "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          "Brook Lopez" => {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
          "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          "Jason Terry" => {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
    }
  }
  return game
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    if team_data[:players].has_key?(player)
      return team_data[:players][player][:points]
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    if team_data[:players].has_key?(player)
      return team_data[:players][player][:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names()
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player, player_data|
        team_numbers << player_data[:number]
      end
    end
  end
  team_numbers
end

def player_stats(person_search)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      if player == person_search
        return player_data
      end
    end
  end
end

def big_shoe_rebounds()
  biggest_shoe = {"name" => 0}
  # Find the player with the biggest shoe size
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      # Did not find method for easily converting array to fixnum
      # Used [0] to grab the first and only fixnum value instead
      if player_data[:shoe] > biggest_shoe.values[0]
        biggest_shoe = {player => player_data[:shoe]}
      end
    end
    # Return the player with the biggest shoes' rebounds
    big_return = biggest_shoe.keys[0]
    return team_data[:players][big_return][:rebounds]
  end
end
