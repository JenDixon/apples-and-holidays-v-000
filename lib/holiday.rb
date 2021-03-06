require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies[:winter].each do |attribute, supplies|
    supplies << supply
  end
end


def add_supply_to_memorial_day(season, holidays)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_supplies[:spring][:memorial_day] << holidays
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_supplies[season][holiday_name] = supply_array
  holiday_supplies
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_array = holiday_hash[:winter].collect{|key,value| value}
  winter_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |key,value|
  	key_cap = key.capitalize
  	puts "#{key_cap}:"
  	if value.is_a?(Hash)
  		value.each do |inner_key,inner_value|
  			inner_key_cap = inner_key.to_s.split("_").map(&:capitalize).join(' ')
  			array_string = inner_value.join(", ")
  			puts "  #{inner_key_cap}: #{array_string}"
  		end
  	else
  		 puts "  #{key}: #{value}:"
  	end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  results = []
  holiday_hash.each do |key,value|
  	if value.is_a?(Hash)
  		value.each do |inner_key, inner_value|
  			puts inner_key
  			if inner_value.include? "BBQ"
  				results << inner_key
  			end
  		end
  	end
  end
  results
end
