require 'pry'
def game_hash 
  game_hash =
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
      }
    }
  }

  
}

end 
  
  
  




def num_points_scored(player_name)
array2 = []
game_hash.each do |location, team_data|
    team_data.each do |attribute, values|
        if attribute == :players
          values.each do |person, data|
            data.each do |i, j|
              if person == player_name && i == :points
                array2.push(j)
              end

            end
          end
        end
    end
end
return array2[0]
end

def shoe_size(player)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
              
              if person == player 
                
               return data[:shoe]
              end
            end
          end
      end
  end
end

def team_colors(team)
  if team == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team == "Brooklyn Nets"
    game_hash[:home][:colors]
  else

  end
end

def team_names
array2 = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :team_name
                array2.push(values)

            end
          end
  end
  return array2
end


def player_stats(player_name)
  array2=[]
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
                if person == player_name
                  array2.push(data )
                end
            end
          end
      end
  end
  return array2[0]
end


def player_numbers(team)
  array2 = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, values|
          if attribute == :players
              values.each do |person, data|
             array2 << data[:number]
              
                
end

              end
            end
          end
      end
      array2
  end
 

([1,2,5].reduce(:+).to_f / [1,2,3].length.to_f)


#---
# always have a leader and a writer; leader directs; writer types out the code 

# def num_points_scored2(player_name)
#   game_hash.each do |location, team_data|
#   if team_data[:players].has_key?(player_name)
#     return team_data[:players][player_name][:points]
#     end 
#   end
# end 

def num_points_scored2(player_name)
  game_hash.each do |location, team_data|
  if team_data[:players].include?(player_name)
    return team_data[:players][player_name][:points]
    end 
  end
  nil
end 


num_points_scored2("Ben Gordon")

def find_player_hash(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players].include?(player_name)
      return team_data[:players][player_name]
    end 
  end
end 

find_player_hash("Ben Gordon")

def num_points_scored3(player_name)
  find_player_hash(player_name)[:points]
end 

def shoe_size_2(player_name)
  find_player_hash(player_name)[:shoe]
end 

def player_stats(player_name)
  game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(player_name)
      return game_hash[team][:players][player_name]
    end 
  end 
end 

def find_player_hash_2(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players[player_name]
end 

find_player_hash_2("Jeff Adrien")


def winning_team
  away_total = 0 
  home_total = 0 
  
game_hash[:away][:players]

end

  
def big_shoe_rebounds
   biggest_shoe = 0
  player_rebounds = 0
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[1][:shoe] > biggest_shoe
        biggest_shoe = player[1][:shoe] 
        player_rebounds = player[1][:rebounds] 
      end
    end
  end
  return player_rebounds
end