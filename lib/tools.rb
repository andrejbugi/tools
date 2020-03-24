require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.length < 2
      return false if divide_by_10? % 10 != 0
      return false if @stripped.scan(/\D/).any? || @reversed_array.length < 2

      true

    end

    private

    def divide_by_10?
      stripped = @str.delete(' ')
      @stripped = stripped
      puts "strip_str: #{stripped}"
      reversed_strip = stripped.reverse
      puts "reversed_strip: #{reversed_strip}"
      reversed_array = reversed_strip.chars.map(&:to_i)
      @reversed_array = reversed_array
      puts "reversed_array: #{reversed_array}"
      every_second_range = (1..reversed_array.length - 1).step(2)
      every_second_array = every_second_range.map { |i| reversed_array[i] }
      puts "every_second_array: #{every_second_array}"
      every_first_range = (0..reversed_array.length - 1).step(2)
      every_first = every_first_range.map { |i| reversed_array[i] }
      puts every_first.sum
      every_second = []
      every_second_array.each do |num|
        num += num
        if num >= 10
          num -= 9
        else
          num
        end
        every_second << num
      end
      sum_index = 0
      every_second.each do |index|
        sum_index += index
      end
      sum_index + every_first.sum
    end

  end

  public

  class Raindrop
    def initialize(int)
      @int = int
    end

    def num_factor
      int_factor = @int

      case
      when (int_factor % 5).zero? && (int_factor % 7).zero? && (int_factor % 3).zero?
        'PlingPlangPlong'
      when (int_factor % 3).zero? && (int_factor % 7).zero?
        'PlingPlong'
      when (int_factor % 5).zero? && (int_factor % 3).zero?
        'PlingPlang'
      when (int_factor % 5).zero? && (int_factor % 7).zero?
        'PlangPlong'
      when (int_factor % 3).zero?
        'Pling'
      when (int_factor % 5).zero?
        'Plang'
      when (int_factor % 7).zero?
        'Plong'
      else
        int_factor.to_s
      end
    end

  end
end
