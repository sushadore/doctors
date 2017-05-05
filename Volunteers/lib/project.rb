class Project
  attr_accessor()
end

  def Project.all
    return_projects = DB.exec('SELECT * FROM projects;')
    projects = []
    return_projects.each do |project|
      name = project['description']
      id = project['id'].to_i
      projects.push(Project.new(:description => description, :id => id))
    end
    projects
  end
