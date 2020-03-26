require "tools/version"

module Tools

  class Allergies

    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }

    def initialize(score)
      @score = score
    end

    def allergic_to?(allergen)
      # ALLERGENS[@score] == allergen
      # input 3
      # [128, ...,2, 1]
      # get elements less then or equal to 3
      # [2, 1]
      # iteration 1: 3 - 2 -> 1   ALLERGENS[2] -> peanuts; :rest = 1
      # iteration 2: 1 - 1 -> 0   ALLERGENS[1] -> eggs; :rest = 0
      # each elements map to collection of allergens
      # input 5
      # [128, ...,2, 1]
      # get elements less then or equal to 5
      # [4, 2, 1]
      # iteration 1: 5 - 4 -> 1   ALLERGENS[4] -> shellfish; :rest = 1
      # iteration 2: 1 - 1 -> 0   ALLERGENS[1] -> eggs; :rest = 0
      # each elements map to collection of allergens
    end
  end


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


  # failed experiment


    # def strip_reverse
    #   stripped = @str.delete(' ')
    #   @stripped = stripped
    #   reversed_strip = stripped.reverse
    #   reversed_array = reversed_strip.chars.map(&:to_i)
    #   @reversed_array = reversed_array
    # end

    # def every_first
    #   reversed_array = @reversed_array
    #   every_first_range = (0..reversed_array.length - 1).step(2)
    #   every_first = every_first_range.map { |i| reversed_array[i] }
    #   @every_first = every_first.sum
    # end

    # def every_second
    #   reversed_array = @reversed_array
    #   every_second_range = (1..reversed_array.length - 1).step(2)
    #   every_second_array = every_second_range.map { |i| reversed_array[i] }
    #   @every_second_array = every_second_array
    # end

    # def second_doubled
    #   every_second_array = @every_second_array
    #   every_second = []
    #   every_second_array.each do |num|
    #     num += num
    #     if num >= 10
    #       num = num - 9
    #     else
    #       num
    #     end
    #     every_second << num
    #   end
    #   sum_index = 0
    #   every_second.each do |index|
    #     sum_index += index
    #   end
    #   @sum_index = sum_index
    # end
