class Project
  attr_accessor(:name, :description)

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @id = attributes[:id]
  end

  def Project.all
    # return_projects = (DB.exec'SELECT * FROM projects;')
    projects = []
# return_projects.each do |project|
(DB.exec'SELECT * FROM projects;').each do |project|
      name = project['name']
      projects.push(Project.new(:name => project['name'], :description => project['description'], :id => project['id'].to_i))
    end
    projects
  end
end
