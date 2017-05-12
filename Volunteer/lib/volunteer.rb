class Volunteer
  attr_accessor :volunteer_name, :project_id, :id

  def initialize (attributes)
    @volunteer_name = attributes[:volunteer_name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def Volunteer.all
    volunteers = []
    (DB.exec"SELECT * FROM volunteers;").each do |volunteer|
      volunteers.push(Volunteer.new(:volunteer_name => volunteer['volunteer_name'], :project_id => volunteer['project_id'].to_i, :id => volunteer['id'].to_i))
    end
    volunteers
  end

  def == (another_volunteer)
    self.id.eql? another_volunteer.id
  end

  def save
    @id = (DB.exec"INSERT INTO volunteers (volunteer_name, project_id) VALUES('#{@volunteer_name}', #{@project_id}) RETURNING id;").first['id'].to_i
  end

  def delete
    DB.exec"DELETE FROM volunteers WHERE id = #{self.id};"
  end

  def update (attributes)
    @volunteer_name = attributes[:volunteer_name]
    DB.exec"UPDATE volunteers SET volunteer_name = '#{@volunteer_name}' WHERE id = #{self.id};"
  end

  def Volunteer.find (id)
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.id == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end
end
