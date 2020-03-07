require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.length <= 1

      true
    end

    def reversed
      str_list = @str.split('').map { |s| s.to_i }
      str_list_reversed = str_list.reverse
      case
      when str_list_reversed.length() <= 3
        str_digit = str_list_reversed[1] + str_list_reversed[1]
        if str_digit >= 10
          return str_digit = str_digit - 9
        else
          str_digit
        end
      end

      case
      when str_list.length() > 3
        str_digit = str_list[1] + str_list[1]
          if str_digit >= 10
            str_digit = str_digit - 9
          else
            str_digit
          end
          str_digit_1 = str_list[3] + str_list[3]
            if str_digit_1 >= 10
              str_digit_1 = str_digit_1 - 9
            else
              str_digit_1
            end
        return str_digit + str_digit_1
      end

    end

    def calc_str
      str_digit = 0
      str_list = @str.split('').map { |s| s.to_i }
      case
      when str_list.length() <= 3
        str_digit = str_list[1] + str_list[1]
        if str_digit >= 10
          str_digit = str_digit - 9
        else
          str_digit
        end
        return str_digit
      end

      case
      when str_list.length() > 3
        str_digit = str_list[1] + str_list[1]
          if str_digit >= 10
            str_digit = str_digit - 9
          else
            str_digit
          end
          str_digit_1 = str_list[3] + str_list[3]
            if str_digit_1 >= 10
              str_digit_1 = str_digit_1 - 9
            else
              str_digit_1
            end
        return str_digit + str_digit_1
      end
    end
  end
end
