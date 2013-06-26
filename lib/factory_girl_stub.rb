class FactoryGirl
  def self.build(klass, *attrs)
    (stub_class klass).new
  end

  def self.create(klass, *attrs)
    (stub_class klass).new
  end

  private

  def self.stub_class(name)
    name.to_s.capitalize.split(/::/).inject(Object) do |context, name|
      begin
        context.const_get(name)
      rescue NameError
        context.const_set(name, Class.new)
      end
    end
  end
end

