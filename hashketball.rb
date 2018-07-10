require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1
        }
      } # [players]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12
        }
      } # [players]
    }
  }
end

def num_points_scored string
  team = game_hash.select { |k,v| v[:players].include? string}.keys[0]

  game_hash[team][:players][string][:points]
end

def shoe_size string
  team = game_hash.select { |k,v| v[:players].include? string}.keys[0]

  game_hash[team][:players][string][:shoe]
end

def team_colors string
  team = game_hash.select { |k,v| v[:team_name].include? string}.keys[0]

  game_hash[team][:colors]
end

def team_names
  game_hash.collect { |k, v| v[:team_name] }

end

def player_numbers string
  team = game_hash.select { |k,v| v[:team_name].include? string}.keys[0]

  game_hash[team][:players].values.collect { |player| player[:number] }
end

def player_stats string
  team = game_hash.select { |k,v| v[:players].include? string }.keys[0]
# binding.pry

  game_hash[team][:players][string]
end

def big_shoe_rebounds
shoe_sizes = []
player = nil

  game_hash.values.each { |team|
    biggest_shoe = team[:players].each { |player, stat|
      shoe_sizes << stat[:shoe]
    }
  }

biggest_shoe = shoe_sizes.max(1)

team = game_hash.select { |k,v| v[:players].select { |k,v| if v[:shoe] == biggest_shoe[0]; player = v end } }
# player = game_hash[team][:players].select { |k,v| v[:shoe] == biggest_shoe[0] }.keys[0]

player[:rebounds]
end
