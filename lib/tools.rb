require "tools/version"

module Tools
  class Armstrong
    def initialize(number)
      @number = number
    end

    def valid?
      sum == number
    end

    private

    def sum
      digits.sum { |digit| digit**size}
    end

    def number
      @number.abs
    end

    def digits
      number.digits
    end

    def size
      digits.size
    end
  end

  class Resistors
    COLOR_BANDS = {
      black: {
        color: 0,
        multiplier: 1,
        tolerance: 20
      },
      brown: {
        color: 1,
        multiplier: 10,
        tolerance: 1
      },
      red: {
        color: 2,
        multiplier: 100,
        tolerance: 2
      },
      orange: {
        color: 3,
        multiplier: 1_000,
        tolerance: 0.05
      },
      yellow: {
        color: 4,
        multiplier: 10_000,
        tolerance: 0.02
      },
      green: {
        color: 5,
        multiplier: 100_000,
        tolerance: 0.5
      },
      blue: {
        color: 6,
        multiplier: 1_000_000,
        tolerance: 0.25
      },
      violet: {
        color: 7,
        multiplier: 10_000_000,
        tolerance: 0.1
      },
      gray: {
        color: 8,
        multiplier: 100_000_000,
        tolerance: 0.05
      },
      white: {
        color: 9,
        multiplier: 1_000_000_000,
        tolerance: 10
      },
      gold: {
        color: 0,
        multiplier: 0.1,
        tolerance: 5
      },
      silver: {
        color: 0,
        multiplier: 0.01,
        tolerance: 10
      }
    }.freeze

    attr_reader :color_1, :color_2

    def initialize(colors)
      @color_1, @color_2, @multiplier, @tolerance = colors
    end

    def specification
      "#{base * multiplier} ohms +/-#{tolerance}%"
    end

    def output
      (0..1).map { |elem| base[elem] }.join.to_i
    end

    private

    def multiplier
      COLOR_BANDS.fetch(@multiplier.downcase.to_sym)[:multiplier]
    end

    def base
      color(color_1) * 10 + color(color_2)
    end

    def color(color_key)
      COLOR_BANDS.fetch(color_key.downcase.to_sym)[:color]
    end

    def tolerance
      @tolerance.nil? ? 20 : COLOR_BANDS.fetch(@tolerance.downcase.to_sym)[:tolerance]
    end
  end

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
      score_allergens.include?(allergen)
    end

    def score_allergens
      allergens_key.map { |k| ALLERGENS[k] }
    end

    private

    def keys
      ALLERGENS.keys.select { |k, _v| k <= score }.sort.reverse!
    end

    def allergens_key
      scr = @score
      keys.select { |key| scr >= key && scr -= key }
    end

    def score
      @score -= 256 while @score >= 256
      @score
    end
  end

  class Luhn
    def initialize(str)
      @stripped = str.delete(' ')
    end

    def valid?
      return false if @stripped.length < 2
      return false if @stripped.scan(/\D/).any?
      return false if (rest_of_digits + checksum).sum % 10 != 0

      true

    end

    private

    def reverse
      @stripped.reverse
    end

    def every_sec_digit
      indexes(1).map { |i| reverse[i].to_i }
    end

    def rest_of_digits
      indexes.map { |i| reverse[i].to_i }
    end

    def indexes(ind = 0)
      (ind..@stripped.length - 1).step(2)
    end

    def checksum
      every_sec_digit.map do |num|
        num += num
        if num >= 10
          num -= 9
        else
          num
        end
      end
    end
  end

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

  class Grains
    SQUARES_BOARD = 64

    def self.square(index)
      verify_number(index)
      2**(index - 1)
    end

    def self.verify_number(index)
      is_okey = index <= SQUARES_BOARD && index.is_a?(Integer) && index.positive?
      raise ArgumentError unless is_okey
    end

    def self.total
      (2**SQUARES_BOARD) - 1
    end
  end

  class Antipodes
    def initialize(input_array)
      @input_array = input_array
    end

    def division_by_two
      if @input_array.size > 1
        checksum.map { |ind| ind / 2.0 }
      else
        @input_array
      end
    end

    private

    def split_array_in_two
      checking_if_odd
      @input_array.each_slice(middle).to_a
    end

    def checking_if_odd
      @input_array.length.odd? ? middle_number : @input_array
    end

    def left
      split_array_in_two.flatten.first(middle)
    end

    def reversed_right
      split_array_in_two.flatten.last(middle).reverse!
    end

    def checksum
      (left + reversed_right).each_slice(middle).to_a.transpose.map(&:sum)
    end

    def middle
      @input_array.length / 2
    end

    def middle_number
      @input_array.delete_at(middle)
    end
  end

  class QueenAttack
    def initialize(wht_pos = [], blk_pos = [])
      @white_position = wht_pos
      @black_position = blk_pos
    end

    def attack_each_other?
      return true if column || row || diagonal

      false
    end

    private

    def check
      return true if white_pos == true && black_pos == true

    end

    def white_pos
      raise ArgumentError unless @white_position.all? { |i| i >= 0 && i < 8 }
    end

    def black_pos
      raise ArgumentError unless @black_position.all? { |i| i >= 0 && i < 8 }
    end

    def column
      check
      return true if @white_position[0] == @black_position[0]
    end

    def row
      check
      return true if @white_position[1] == @black_position[1]
    end

    def diagonal
      check
      true if (@black_position[0] - @white_position[0]).abs == (@black_position[1] - @white_position[1]).abs
    end
  end

  class ChocolateDilemma
    def initialize(first_area, second_area)
      @first_area = first_area
      @second_area = second_area
    end

    def fairness?
      first_person == second_person
    end

    private

    def first_person
      @first_area.map! { |i| i[0] * i[1] }.sum
    end

    def second_person
      @second_area.map! { |i| i[0] * i[1] }.sum
    end
  end

  class OddNumber
    def initialize(input_array)
      @input_array = input_array
    end

    def first_odd_integer
      first_odd
    end

    def all_odd_integers
      odd_integers
    end

    private

    # Grouping arrays into hash where key is the number
    # and value is the times he is contained in the array
    def group_by_appeareance
      @input_array.group_by(&:itself)
    end

    # Returns first integer that appears odd number of times
    def first_odd
      group_by_appeareance.map do |k,v|
        return k if v.length.odd?
      end
    end

    # Returns all integers that appear odd number of times
    def odd_integers
      odds_array = []
      group_by_appeareance.map do |k,v|
        if v.length.odd?
          odds_array << k
        end
      end
      odds_array
    end
  end

  class AdjustTheTime
    def initialize(given_time, hour, min, sec)
      @current_hr, @current_min, @current_sec = given_time.split(':').map(&:to_i)
      @hour = hour
      @min = min
      @sec = sec
    end

    def adjusted
      time
      x = format('%02d', hour)
      y = format('%02d', minutes)
      z = format('%02d', seconds)
      [x.to_s, y.to_s, z.to_s].join(':')
    end

    private

    def time
      hour
      minutes
      seconds
    end

    def seconds
      x = @current_sec + @sec
      while x >= 60
        @min += 1
        x -= 60
      end
      x
    end

    def minutes
      x = @current_min + @min
      while x >= 60
        @hour += 1
        x -= 60
      end
      x
    end

    def hour
      x = @current_hr + @hour
      x -= 24 while x >= 24
      x
    end
  end

  class PokemonDamage
    def initialize(type_element, type_2_element, attack, defense)
      @attack = attack
      @defense = defense
      @el_1 = type_element
      @el_2 = type_2_element
    end

    def damage
      50 * (effectiveness / @defense)
    end

    def effectiveness
      check
    end

    private

    def check
      if @el_1 == 'fire'
        fire_dmg
      elsif @el_1 == 'water'
        water_dmg
      elsif @el_1 == 'grass'
        grass_dmg
      else
        electricity_dmg
      end
    end

    def fire_dmg
      if @el_1 == 'fire'
        if @el_2 == 'grass'
          @attack * 2
        elsif @el_2 == 'water'
          @attack * 0.5
        else
          @attack * 1
        end
      end
    end

    def water_dmg
      if @el_1 == 'water'
        if @el_2 == 'fire'
          @attack * 2
        elsif @el_2 == 'grass'
          @attack * 0.5
        elsif @el_2 == 'electric'
          @attack * 0.5
        end
      end
    end

    def grass_dmg
      if @el_1 == 'grass'
        if @el_2 == 'water'
          @attack * 2
        elsif @el_2 == 'fire'
          @attack * 0.5
        else
          @attack * 1
        end
      end
    end

    def electricity_dmg
      if @el_1 == 'electric'
        if @el_2 == 'water'
          @attack * 2
        else
          @attack * 1
        end
      end
    end
  end

  class RomanNumbers
    ROMAN_NUMBERS = {
      'I' => 1, 'IV' => 4, 'V' => 5,
      'IX' => 9, 'X' => 10, 'XL' => 40,
      'L' => 50, 'XC' => 90, 'C' => 100,
      'CD' => 400, 'D' => 500, 'CM' => 900,
      'M' => 1000
    }.freeze

    def initialize
    end

    def convert_to_roman(num)
      calculation(num)
      resulting
    end

    private

    def reversed(arr, num)
      arr.values.select { |v| v <= num }.sort.reverse
    end

    def minus(num, reversed)
      num - reversed[0]
    end

    def calculation(num)
      @result = []
      while num >= 1
        m = num - minus(num, reversed(ROMAN_NUMBERS, num))
        @result << m
        num = minus(num, reversed(ROMAN_NUMBERS, num))
      end
    end

    def resulting
      @result.map { |r| ROMAN_NUMBERS.invert[r] }.join
    end
  end
end
