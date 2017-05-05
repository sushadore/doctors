class Volunteer
attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def Volunteer.all
    volunteers = []
    (DB.exec"SELECT * FROM volunteers;").each do |volunteer|
      volunteer.push(Volunteer.new(:name => volunteer['name'], :id => project['id'].to_i))
    end
    volunteers
  end
end
