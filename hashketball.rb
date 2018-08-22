# Write your code here!
#require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
        :number => '0',
        :shoe => '16',
        :points => '22',
        :rebounds => '12',
        :assists => '12',
        :steals => '3',
        :blocks => '1',
        :slam_dunks => '1'
        },
        "Reggie Evans" => {
        :number => '30',
        :shoe => '14',
        :points => '12',
        :rebounds => '12',
        :assists => '12',
        :steals => '12',
        :blocks => '12',
        :slam_dunks => '7'
        },
        "Brook Lopez" => {
        :number => '11',
        :shoe => '17',
        :points => '17',
        :rebounds => '19',
        :assists => '10',
        :steals => '3',
        :blocks => '1',
        :slam_dunks => '15'
        },
        "Mason Plumlee" => {
        :number => '1',
        :shoe => '19',
        :points => '26',
        :rebounds => '12',
        :assists => '6',
        :steals => '3',
        :blocks => '8',
        :slam_dunks => '5'
        },
        "Jason Terry" => {
        :number => '31',
        :shoe => '15',
        :points => '19',
        :rebounds => '2',
        :assists => '2',
        :steals => '4',
        :blocks => '11',
        :slam_dunks => '1'
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
        :number => '4',
        :shoe => '18',
        :points => '10',
        :rebounds => '1',
        :assists => '1',
        :steals => '2',
        :blocks => '7',
        :slam_dunks => '2'
        },
        "Bismak Biyombo" => {
        :number => '0',
        :shoe => '16',
        :points => '12',
        :rebounds => '4',
        :assists => '7',
        :steals => '7',
        :blocks => '15',
        :slam_dunks => '10'
        },
        "Ben Gordon" => {
        :number => '8',
        :shoe => '15',
        :points => '33',
        :rebounds => '3',
        :assists => '2',
        :steals => '1',
        :blocks => '1',
        :slam_dunks => '0'
        },
        "DeSagna Diop" => {
        :number => '2',
        :shoe => '14',
        :points => '24',
        :rebounds => '12',
        :assists => '12',
        :steals => '4',
        :blocks => '5',
        :slam_dunks => '5'
        },
        "Brendan Haywood" => {
        :number => '33',
        :shoe => '15',
        :points => '6',
        :rebounds => '12',
        :assists => '12',
        :steals => '22',
        :blocks => '5',
        :slam_dunks => '12'
        }
      }
    }
  }
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        puts "made it here!"
        data.each do |player, stats|
          puts player
          if player == name
            puts "your boy"
            points = stats[:points].to_i
          end
        end
      end
    end
  end
  points
end

def shoe_size(name)
  size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        puts "made it here!"
        data.each do |player, stats|
          puts player
          if player == name
            puts "your boy"
            size = stats[:shoe].to_i
          end
        end
      end
    end
  end
  size
end

def team_colors(name)
  colors = Array.new
  temp_hash = Hash.new
  found_it = false
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :colors && found_it
        puts "im here"
        colors = data
        puts colors
        return colors
      end
      if attribute == :team_name
        puts attribute
        if data == name
          found_it = true
        end
      end
    end
  end
  colors
end

def team_names
  names = Array.new
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        names.push(data)
      end
    end
  end
  names
end

def player_numbers(team)
  numbers = Array.new
  correct_team = false
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        if data == team
          correct_team = true
          puts "found team"
        else
          correct_team = false
        end
      end
      if attribute == :players
        data.each do |player, stats|
          puts "im here"
          puts correct_team
          if correct_team
            puts "found stats"
            numbers.push(stats[:number].to_i)
            puts numbers
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  p_stats = Hash.new
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            puts name
            stats.each do |key, value|
              p_stats[key] = value.to_i
              puts p_stats
            end
          end
        end
      end
    end
  end
  p_stats
end

def big_shoe_rebounds
  shoe_rebounds = [0,0]
  bigger = false
  #index 0 is shoe size
  #index 1 is rebounds
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |key, value|
            if key == :shoe
              if value.to_i > shoe_rebounds[0]
                shoe_rebounds[0] = value.to_i
                bigger = true
              end
            end
            if key == :rebounds && bigger
              shoe_rebounds[1] = value.to_i
            end
          end
        end
      end
    end
  end
  shoe_rebounds[1]
end




#def good_practices
#  game_hash.each do |location, team_data|
#    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
#        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end

#good_practices
