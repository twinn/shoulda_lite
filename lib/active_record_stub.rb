class ActiveRecord
  class Base
    Calls = []
    def self.method_missing(meth, *args, &block)
      Calls.push({method: meth, arguments: args})

    end

    def respond_to?(method_sym, include_private = false)
      if responds_to? method_sym
        true
      else
        super
      end
    end

    def method_missing(meth, *args, &block)
    end

    private
    def responds_to?(method)
      Calls.find{|call| call[:arguments].include? method}
    end
  end 
end
