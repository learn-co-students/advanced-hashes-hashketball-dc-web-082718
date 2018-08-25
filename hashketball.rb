require "pry-byebug"
# Write your code here!
# #game_hash
#     returns a hash
#     returns the correct top-level keys
#     returns the correct team-level keys
def game_hash
  {
  :home => {
    :team_name=> "Brooklyn Nets",
    :colors=> ["Black", "White"],
    :players=> [
      {
        :name=> "Alan Anderson",
        :number=>0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1,
      },
      {
        :name=> "Reggie Evans",
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7,
      },
      {
        :name=> "Brook Lopez",
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15,
      },
      {
        :name=> "Mason Plumlee",
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>12,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5,
      },
      {
        :name=> "Jason Terry",
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1,
      },
    ],
  },

  :away => {
    :team_name=> "Charlotte Hornets",
    :colors=> ["Turquoise", "Purple"],
    :players=> [
      {
        :name=> "Jeff Adrien",
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2,
      },
      {
        :name=> "Bismak Biyombo",
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>7,
        :blocks=>15,
        :slam_dunks=>10,
      },
      {
        :name=> "DeSagna Diop",
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5,
      },
      {
        :name=> "Ben Gordon",
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0,
      },
      {
        :name=> "Brendan Haywood",
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>22,
        :blocks=>5,
        :slam_dunks=>12,
      },
    ],
  }
}
end
#   #num_points_scored
#     knows the number of points scored by each player
def num_points_scored(name)
  answer = nil
  game_hash.each do |team_key,team_value|#iterate down one level
    players_stats = team_value[:players]#set the "value" for players to a variable
      players_stats.each do |players_details|
        if players_details[:name] == name #compares the value at "key:name" to the argument name
          answer = players_details[:points]#selects value at "key:points" to variable answer
        end
      end
  end
  answer
end

# #shoe_size
#     knows the shoe size of each player

def shoe_size(name)#exact same method as above, just switched :points to :shoe
  answer = nil
    game_hash.each do |team_key,team_value|#iterate down one level
      players_stats = team_value[:players]
        players_stats.each do |players_details|
          if players_details[:name] == name
            answer = players_details[:shoe]
          end
        end
    end
    answer
  end

  # #team_colors
  #    knows the Brooklyn Nets colors are Black and White


def team_colors (team_name)
  answer = nil
  game_hash.collect do |team_key, team_value|
    if team_value[:team_name] == team_name
      answer = team_value[:colors]
    end
  end
  answer
end

# #team_names
#   returns the team names

def team_names
  game_hash.collect do |team_key, team_value|
    team_value[:team_name]
  end
end

# #player_numbers
#    returns the player jersey numbers

def player_numbers (team_name)
  player_numbers_list = [] #Empty array to hold lst of players numbers
  game_hash.each do |team_key, team_value|#iterate down 1 level
    if team_value[:team_name] == team_name
      team_value[:players].each do |player_stats|
        player_stats.each do |key, value|#iterate through each players stats
          if key == :number #set :number as the comparison ID
            player_numbers_list << value # push players numbers/"value" into the empty array
          end
        end
      end
    end
  end
  player_numbers_list
end

# #player_stats
#    returns all stats for a given player

 def player_stats(player_name)
  player_stats = []
  game_hash.collect do |team_key, team_value|
    team_value[:players].each do |stats|
       if stats[:name] == player_name
        stats.delete(:name)#deletes name to keep in same formart ask for in test.
        player_stats = stats
      end
    end
  end
  player_stats
end

# #big_shoe_rebounds
#   returns the number of rebounds of the player with the biggest shoe size

 def big_shoe_rebounds
  big_shoes_player = 0
  rebounds = 0
    game_hash.each do |team_key, team_value|
      team_value[:players].each do |stats|
        if stats[:shoe] > big_shoes_player #if the shoe stats for the current player being compared is bigger than the current "big_shoes_player" then continue to next lines of code that cause "big_shoes_player" to turn into the current player and reflect his rebounds.
          big_shoes_player = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end
