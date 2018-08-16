require "pry"

def game_hash
  {
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
        }
      }
    }
  }
end

def num_points_scored(name)
  ans = ""
  game_hash.each do |location, team_data|
      team_data.each do |team_info, roster|
        if roster.is_a?(Hash)
          roster.each do |player_name, stats|
            if player_name == name
              ans = stats.fetch(:points)
          end
        end
      end
    end
  end
  ans
end

def shoe_size(name)
  ans = ""
  game_hash.each do |location, team_data|
      team_data.each do |team_info, roster|
        if roster.is_a?(Hash)
          roster.each do |player_name, stats|
            if player_name == name
              ans = stats.fetch(:shoe)
          end
        end
      end
    end
  end
  ans
end

def team_colors(team)
  ans = ""
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if team == value
        ans = team_data[:colors]
      end
    end
  end
  ans
end

def team_names
  array = []
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      array.push(team_data[:team_name])
    end
  end
  array = array.uniq
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |team_info, roster|
        if roster.is_a?(Hash)
          roster.each do |player_name, stats|
            array.push(stats[:number])
          end
        end
      end
    end
  end
  array
end

def player_stats(name)
  ans = ""
  game_hash.each do |location, team_data|
      team_data.each do |team_info, roster|
        if roster.is_a?(Hash)
          roster.each do |player_name, stats|
            if player_name == name
              ans = roster[player_name] 
          end
        end
      end
    end
  end
  ans
end

def big_shoe_rebounds
  array = []
  ans = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_info, roster|
      if roster.is_a?(Hash)
        roster.each do |player_name, gen_stats|
          gen_stats.each do |key, value|
            array.push(gen_stats[:shoe])
            array.sort!
            if gen_stats[:shoe] == array[-1]
              ans = gen_stats[:rebounds]
            end
          end    
        end
      end
    end
  end
  ans
end

def most_points_scored
  array = []
  ans = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_info, roster|
      if roster.is_a?(Hash)
        roster.each do |player_name, gen_stats|
          gen_stats.each do |key, value|
            array.push(gen_stats[:points])
            array.sort!
            if gen_stats[:points] == array[-1]
              ans = player_name
            end
          end    
        end
      end
    end
  end
  ans
end

def winning_team
  sum = 0
  compare = 0
  ans = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_info, roster|
      if roster.is_a?(Hash)
        roster.each do |player_name, gen_stats|
          gen_stats.each do |key, value|
            sum += gen_stats[:points]
          end
          if sum > compare
            compare = sum
              if compare == sum 
                ans = team_data[:team_name]
              end
          end
        end
        sum = 0
      end
    end
  end
  ans
end

def player_with_longest_name
  array = []
  ans = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_info, roster|
      if roster.is_a?(Hash)
        roster.each do |player_name, gen_stats|
          array.push(player_name.length)
          array.sort!
          if player_name.length == array[-1]
            ans = player_name
          end
        end
      end
    end
  end
  ans    
end

def long_name_steals_a_ton?
  ans = ""
  array_namelength = []
  array_steals = []
  
  game_hash.each do |location, team_data|
    team_data.each do |team_info, roster|
      if roster.is_a?(Hash)
        roster.each do |player_name, gen_stats|
          array_steals.push(roster[:steals])
          array_steals.sort!
            
          array_namelength.push(player_name.length)
          array_namelength.sort!
          if player_name.length == array_namelength[-1]
            ans = roster[:steals]
          end
        end
      end
    end
  end
  if ans == array_steals[-1]
    true 
  else 
    false 
  end
end