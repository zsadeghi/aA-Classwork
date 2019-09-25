class AttrAccessorObject
  def self.my_attr_accessor(*names)
    name.each do |name|
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") { |value| instance_variable_set("@#{name}", value)}
  end

end
