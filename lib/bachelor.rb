require 'json'
require 'pry'

def get_first_name_of_season_winner(data, season)

  data[season].each do |k|
  #binding.pry
    if k["status"] == "Winner"
      return k["name"].split(" ")[0]
    end
  end
end


def get_contestant_name(data,occupancy)
  data.each do |season, season_data|
    season_data.each do |values|
      if values["occupation"] == occupancy
        return values["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_counter = 0
  data.each do |season, season_data|
    season_data.each do |values|
      if values["hometown"] == hometown
        hometown_counter +=1
      end
    end
  end
  hometown_counter
end

def get_occupation(data, hometown)
  data.each do |season, season_data|
    season_data.each do |values|
      if values["hometown"] == hometown
        return values["occupation"]
      end
    end
  end
end


def get_average_age_for_season(data,season)
  counter = 0
  num_contestant = 0
  data[season].each do |k|
    counter += k["age"].to_f
    num_contestant += 1
  end
  (counter/num_contestant).ceil
end
