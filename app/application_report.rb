require 'json'
require 'time'
# ApplicationReport class
class ApplicationReport
  def initialize(json_filename)
    @file = File.read(json_filename)
    @data = parse_data(@file)
    @counts = {}
  end

  def retrieve_trend(channel = 'all')
    filter_by_channel(channel)
    hour_groups = group_by_hour
    average_per_hour(hour_groups)
    @counts
  end

  private

  # Formats data and extracts the inner array
  def parse_data(json)
    data = JSON.parse json
    data["applications"]
  end

  # Filters the data by the given application channel - all, website, etc.
  def filter_by_channel(channel)
    unless channel == 'all' 
      @data = @data&.select { |application| application['channel'] == channel }  
    end
  end

  # Groups the data into records per hour
  def group_by_hour
    @data.group_by{ |application| Time.parse(application["timestamp"]).hour }
  end 

  # Calculates the number of days for which data is provided
  def number_of_days
     @data.group_by{ |application| Time.parse(application["timestamp"]).day }&.count
  end

  # Calculates the average records per hour over the given period 
  def average_per_hour(records)
    days = number_of_days
    for hour in 0..23 do
      value = !records[hour].nil? && records[hour].any? ? (records[hour]&.count.to_f/days + 0.5).floor : 0
      @counts.store(hour, value)
    end
  end
end
