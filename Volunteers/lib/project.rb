class Project
  attr_accessor(:title, :description, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @description = attributes[:description]
    @id = attributes[:id]
  end

  def Project.all
    projects = []
    (DB.exec"SELECT * FROM projects;").each do |project|
      projects.push(Project.new(:title => project['title'], :description => project['description'], :id => project['id'].to_i))
    end
    projects
  end

  def ==(another_project)
    self.title.==(another_project.title) & self.id.==(another_project.id)
  end

  def save
    @id = (DB.exec"INSERT INTO projects (title, description) VALUES ('#{@title}', '#{@description}') RETURNING id;").first['id'].to_i
  end

  def update_title(attributes)
    @title = attributes[:title]
    DB.exec"UPDATE projects SET title = '#{@title}' WHERE id = #{self.id};"
  end

  def update_description(attributes)
    @description = attributes[:description]
    DB.exec"UPDATE projects SET description = '#{@title}' WHERE id = #{self.id};"
  end

  def delete
    DB.exec"Delete FROM projects WHERE id = #{self.id};"
  end
end
