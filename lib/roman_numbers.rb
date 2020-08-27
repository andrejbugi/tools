require "tools/version"

module Tools
  class RomanNumbers
    ROMAN_NUMBERS = {
      'I' => 1, 'IV' => 4, 'V' => 5,
      'IX' => 9, 'X' => 10, 'XL' => 40,
      'L' => 50, 'XC' => 90, 'C' => 100,
      'CD' => 400, 'D' => 500, 'CM' => 900,
      'M' => 1000
    }.freeze

    def initialize(num)
      @num = num
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
