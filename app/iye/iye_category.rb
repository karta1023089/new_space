class IyeCategory
  attr_accessor :name, :keys

  def initialize attributes={}
    @name = attributes[:name]
    @keys = Set.new
  end

  def add_key key
    self.keys.add(key)
  end

  def complete?
    self.keys.all? {|key| key.complete?}
  end
end