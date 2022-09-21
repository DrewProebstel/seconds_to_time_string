require 'pry'

class Clock
  attr_accessor :seconds, :time_hash

  def initialize(seconds)
    @seconds = seconds
  end

  def add_second
    @seconds = @seconds += 1
  end

  def make_seconds_time
    time_hash = {:hours => 0, :minutes => 0, :seconds => 0}
    total_time = @seconds

    time_hash[:hours] = total_time/3600
    total_time = total_time % 3600

    time_hash[:minutes] = total_time/60
    total_time = total_time % 60

    time_hash[:seconds] = total_time
    @time_hash = time_hash
  end

  def print_time
    make_seconds_time
    @time_hash[:hours] = @time_hash[:hours] % 24

    final_string = ""
    if @time_hash[:hours] == 0
      final_string += "12:"
    elsif @time_hash[:hours] > 12
      final_string += (@time_hash[:hours] -12).to_s + ":"
    else
      final_string += (@time_hash[:hours]).to_s + ":"
    end

    if @time_hash[:minutes] < 10
      final_string += "0"
    end

    final_string += @time_hash[:minutes].to_s + ":"

    if @time_hash[:seconds] < 10
      final_string += "0"
    end

    final_string = final_string + @time_hash[:seconds].to_s

    if @time_hash[:hours] < 12
      final_string += " am"
    else
      final_string += " pm"
    end
  end
end

test = Clock.new(43199)
p test.print_time
  test.add_second
p test.print_time

test = Clock.new(86399)
p test.print_time
test.add_second

p test.print_time
