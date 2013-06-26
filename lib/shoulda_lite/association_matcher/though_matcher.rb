module ShouldaLite
  class AssociationMatcher::ThroughMatcher
    def initialize(table)
      @table = table
    end

    def matches?(subject)
      subject[:arguments][1].find{|key, value| key == :through && value == @table}
    end

    def failure_message
      "Bad"
    end
  end
end
