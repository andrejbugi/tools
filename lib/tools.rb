require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @stripped = str.delete(' ')
    end

    def valid?
      return false if @stripped.length < 2
      return false if @stripped.scan(/\D/).any?
      return false if checksum % 10 != 0

      true

    end

    private

    def reverse
      @stripped.reverse
    end

    def every_sec_digit
      every_second_range = (1..@stripped.length - 1).step(2)
      every_second_range.map { |i| reverse[i].to_i }
    end

    def rest_of_digits
      every_first_range = (0..@stripped.length - 1).step(2)
      every_first_range.map { |i| reverse[i].to_i }
    end

    def checksum
      every_second = []
      every_sec_digit.each do |num|
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
      sum_index + rest_of_digits.sum
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