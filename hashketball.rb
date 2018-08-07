require "pry"
def game_hash
  statHash = {
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

def num_points_scored (playerName)
  points = 0

  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |name, items|
            if name == playerName
              points = items[:points]

              end
            end
          end
        end
      end
    points
  end

def shoe_size (playerName)
  shoeSize = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, items|
          if name == playerName
            shoeSize = items[:shoe]
          end
        end
      end
    end
  end
shoeSize
end


def team_colors (teamName)
  teamColors = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == teamName
        teamColors = team_data[:colors]
      end
    end
  end
  teamColors
end

def team_names
  teamNames = []

  game_hash.each do |location, team_data|
      teamNames << team_data[:team_name]
  end
  teamNames
end


def teams
  game_hash.values
end

def find_the_team (teamName)
  teams.find do |team|
    team.fetch(:team_name) == teamName
  end
end

def player_numbers(teamName)
  player_numbers = []
  home = game_hash.fetch(:home)
  away = game_hash.fetch(:away)

  if home[:team_name] == teamName
    players = home.fetch(:players)
    players.each do |k, v|
      v.each do |key, value|
        if key == :number
          player_numbers << value
        end
      end
    end
  elsif away[:team_name] == teamName
    players = away.fetch(:players)
    players.each do |k, v|
      v.each do |key, value|
        if key == :number
          player_numbers << value
        end
      end
    end
  end

  player_numbers
end


def player_stats (playerName)
  stats = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, items|
          if name == playerName
            stats = items
          end
        end
      end
    end
  end
  stats
end


def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_biggest_shoe_size
  players.max_by{|player, stats| stats.fetch(:shoe)}[1]
end

def big_shoe_rebounds
  player_biggest_shoe_size.fetch(:rebounds)
end
