module ShouldaLite
  class ValidationMatcher::LengthMatcher
    def initialize(max)
      @max = max
    end

    def matches?(subject)
      subject[:arguments][1][:length].find{|key, value| key == :maximum && value == @max}
    end

    def failure_message
      "Bad"
    end
  end
end
