require 'pry'

def game_hash
  game_hash = {
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
          slam_dunks: 15,
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
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
        }
      }
    }
  }
end 

def num_points_scored(name)
  game_hash.each do |location, team_attribute|
    if team_attribute.class == Hash
      team_attribute.each do |attribute, data|
        if data.class == Hash
          data.each do |player_name, player_data|
            if player_name == name 
              return player_data[:points]
            end 
          end 
        end 
      end 
    end 
  end 
end 


def shoe_size(name)
  game_hash.each do |location, team_attribute|
    if team_attribute.class == Hash
      team_attribute.each do |attribute, data|
        if data.class == Hash
          data.each do |player_name, player_data|
            if player_name == name 
              return player_data[:shoe]
            end 
          end 
        end 
      end 
    end 
  end 
end 

def team_colors(team_name)
  game_hash.each do |location, team_attribute|
    if team_attribute[:team_name] == team_name
      return team_attribute[:colors]
    end 
  end 
end 

def team_names
  name_array = []
  game_hash.each do |location, team_attribute|
    name_array << team_attribute[:team_name]
  end 
  name_array
end

def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |location, team_attribute|
    if game_hash[location][:team_name] == team_name
      game_hash[location][:players].each do |player, stats|
        jersey_array << game_hash[location][:players][player][:number]
      end
    end 
  end 
  jersey_array
end 

def player_stats(name)
  game_hash.each do |location, team_attribute|
    if game_hash[location][:players].key?(name) == true 
      return game_hash[location][:players][name]
    end 
  end 
end

def big_shoe_rebounds
  shoe_hash = {}
  game_hash.each do |location, team_attribute|
    game_hash[location][:players].each do |player, stats|
      shoe_hash[player] = game_hash[location][:players][player][:shoe]
    end 
  end 
  
  max = 0
  biggest = ''
  
  shoe_hash.each do |player, size|
    if size > max
      max = size
      biggest = player
    end 
  end 
  
  game_hash.each do |location, team_attribute|
    if game_hash[location][:players].key?(biggest) == true 
      return game_hash[location][:players][biggest][:rebounds]
    end 
  end 
  
end 
