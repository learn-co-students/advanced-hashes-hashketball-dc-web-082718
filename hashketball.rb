require "pry"
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
  },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end


def num_points_scored (player_name)
  points_scored = 0
  
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, player_stats|
      if name == player_name
        player_stats.each do |skill, count|
          points_scored = player_stats[:points]
        end
      end
    end
  end
points_scored
end


def shoe_size (player_name)
  shoe_size = 0
  
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, player_stats|
      if name == player_name
        player_stats.each do |skill, count|
          shoe_size = player_stats[:shoe]
        end
      end
    end
  end
  shoe_size
end


def get_team_hash (team_name)
  team_hash = {}
  
  game_hash.each do |location, team_info|
    if team_info[:team_name] == team_name
      team_hash = team_info
    end
  end
  team_hash
end


def team_colors (team_name)
  colors_array = get_team_hash(team_name)[:colors]
end

def team_names
  name_array = []
  
  game_hash.each do |location, team_info|
    team_info.each do |team_stat, fact|
      if team_stat == :team_name
        name_array << fact
      end
    end
  end
  name_array
end

def player_numbers (team_name)
  jersey_nums_array = []

  get_team_hash(team_name)[:players].each do |name, player_stats|
    jersey_nums_array << player_stats[:number]
  end
  jersey_nums_array
end

def player_stats (player_name)
  stat_hash = {}
  
  game_hash.each do |location, team_info|
    team_info.each do |team_stat, fact|
      team_info[:players].each do |name, player_stats|
        if name == player_name
          stat_hash = player_stats
        end
      end
    end
  end
  stat_hash
end


def player_hashes
  game_hash[:away][:players].merge(game_hash[:home][:players])
end


def player_names_array
  player_names = []
  
  player_hashes.each do |name, player_stats|
    player_names << name
  end
  player_names
end


def big_shoe_rebounds
  shoes_array = []
  
  player_hashes.each do |name, player_stats|
    shoes_array << player_stats[:shoe]
  end
  
  biggest_shoe_player = player_names_array[shoes_array.each_with_index.max[1]]
  player_hashes[biggest_shoe_player][:rebounds]
end
