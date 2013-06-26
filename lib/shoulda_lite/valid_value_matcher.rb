module ShouldaLite
  class ValidValueMatcher
    def initialize(value)
      @value = value
    end

    def matches?(subject)
      calls = ActiveRecord::Base::Calls.find_all {|c| c[:method] == :validates && c[:arguments].include?(@column) }
      correct_format = 
        if calls.last[:arguments][1][:format][:without]
          (@value =~ calls.last[:arguments][1][:format][:without]).nil?
        else
          @value =~ calls.last[:arguments][1][:format][:with]
        end
      correct_length = 
        if calls.last[:arguments][1][:length]
          calls.last[:arguments][1][:length][:maximum] >= @value.length
        else
          true
        end
      correct_length && correct_format
    end

    def for(column)
      @column = column
      self
    end

    def failure_message
      "Bad"
    end
  end
end
