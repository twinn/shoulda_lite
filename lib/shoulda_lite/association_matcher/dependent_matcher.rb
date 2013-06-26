module ShouldaLite
  class AssociationMatcher::DependentMatcher
    def initialize(dependent)
      @dependent = dependent
    end

    def matches?(subject)
      subject[:arguments][1].find{|key, value| key == :dependent && value == @dependent}
    end

    def failure_message
      "Bad"
    end
  end
end
