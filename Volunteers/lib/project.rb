class Project
  attr_accessor(:title, :description, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @description = attributes[:description]
    @id = attributes[:id]
  end

  def Project.all
    # return_projects = (DB.exec'SELECT * FROM projects;')
    projects = []
# return_projects.each do |project|
    (DB.exec"SELECT * FROM projects;").each do |project|
      title = project['title']
      projects.push(Project.new(:title => project['title'], :description => project['description'], :id => project['id'].to_i))
    end
    projects
  end

  def ==(another_project)
    self.title.==(another_project.title) & self.id.==(another_project.id)
  end

  # def ==(another_project)
  #   self.title==(another_project.title) & self.id==(another_project.id)
  # end= result.first().fetch("id").to_i()
    # @id = (DB.exec"INSERT INTO projects (title) VALUES ('#{@title}') (description) VALUES ('#{@description}' RETURNING id;").first['id'].to_i
  # end
end
