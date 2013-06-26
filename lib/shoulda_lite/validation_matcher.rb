module ShouldaLite
  class ValidationMatcher
    def initialize(macro, column)
      @column = column
      @macro = macro
      @submatchers = []
    end

    def matches?(subject)
      calls = ActiveRecord::Base::Calls.find_all {|c| c[:method] == :validates && c[:arguments].include?(@column) }
      calls.any? && @submatchers.none? {|matcher| !matcher.matches?(calls.first) }
    end

    def is_at_most(int)
      @submatchers.push(ValidationMatcher::LengthMatcher.new(int))
      self
    end

    def case_insensitive
      self
    end
    def failure_message
      "Bad"
    end
  end
end
