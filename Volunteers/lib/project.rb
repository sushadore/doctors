class Project
  attr_accessor(:title, :id)

  def initialize(attributes)
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

  def ==(another_project)
    self.title.==(another_project.title) & self.id.==(another_project.id)
  end

  def save
    @id = (DB.exec"INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;").first['id'].to_i
  end

  def update(attributes)
    @title = attributes[:title]
    DB.exec"UPDATE projects SET title = '#{@title}' WHERE id = #{self.id};"
  end

  def delete
    DB.exec"Delete FROM projects WHERE id = #{self.id};"
  end
end
