class Project
  attr_reader :title, :id

  def initialize (attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def Project.all
    projects = []
    (DB.exec"SELECT * FROM projects;").each do |project|
      projects.push(Project.new(:title => project['title'], :id => project['id'].to_i))
    end
    projects
  end

  def == (another_project)
    self.id.eql? another_project.id
  end

  def save
    @id = (DB.exec"INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;").first['id'].to_i
  end

  def update (attributes)
    @title = attributes[:title]
    DB.exec"UPDATE projects SET title = '#{@title}' WHERE id = #{self.id};"
  end

  def delete
    DB.exec"Delete FROM projects WHERE id = #{self.id};"
  end

  def Project.find (id)
    found_project = nil
    Project.all.each do |project|
      if project.id == id
        found_project = project
      end
    end
    found_project
  end

  def volunteers
    project_volunteers = []
    (DB.exec"SELECT * FROM volunteers WHERE project_id = #{self.id()};").each do |volunteer|
      project_volunteers.push(Volunteer.new(:volunteer_name => volunteer['volunteer_name'], :project_id => volunteer['project_id']))
    end
    project_volunteers
  end
end
