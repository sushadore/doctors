class Volunteer
attr_accessor(:name)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end
end
