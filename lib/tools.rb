require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.length <= 1

      stripped = @str.delete(' ')
      puts "strip_str: #{stripped}"
      reversed_strip = stripped.reverse
      puts "reversed_strip: #{reversed_strip}"
      reversed_array = reversed_strip.chars
      puts "reversed_array: #{reversed_array}"
      every_second_range = (1..reversed_array.length-1).step(2)
      every_second_array = every_second_range.map { |i| reversed_array[i] }
      puts "every_second_array: #{every_second_array}"


      true
    end


  end
end
