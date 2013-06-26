module ShouldaLite
  class AssociationMatcher
    def initialize(association, macro)
      @association = association
      @macro = macro
      @submatchers = []
    end

    def matches?(subject)
      calls = ActiveRecord::Base::Calls.find_all {|c| c[:method] == @association && c[:arguments].include?(@macro) }
      calls.any? && @submatchers.none? {|matcher| !matcher.matches?(calls.first) }
    end

    def dependent(dependent)
      @submatchers.push(AssociationMatcher::DependentMatcher.new(dependent))
      self
    end

    def through(table)
      @submatchers.push(AssociationMatcher::ThroughMatcher.new(table))
      self
    end

    def failure_message
      "Bad"
    end
  end
end
