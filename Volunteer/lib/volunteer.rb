class Volunteer
attr_accessor :name, :project_id, :id

  def initialize (attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def Volunteer.all
    volunteers = []
    (DB.exec"SELECT * FROM volunteers;").each do |volunteer|
      volunteers.push(Volunteer.new(:name => volunteer['name'], :project_id => volunteer['project_id'].to_i))
    end
    volunteers
  end

  def == (another_volunteer)
    self.name.==(another_volunteer.name) & self.project_id.==(another_volunteer.project_id)
  end

  def save
    @id = (DB.exec"INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;").first['id'].to_i
  end

  def delete
    DB.exec"DELETE FROM volunteers WHERE id = #{self.id};"
  end

  def update (attributes)
    @name = attributes[:name]
    DB.exec"UPDATE volunteers SET name = '#{@name}' WHERE id = #{self.id};"
  end
end
