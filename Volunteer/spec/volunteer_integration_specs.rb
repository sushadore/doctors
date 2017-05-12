require 'capybara/rspec'
require '.app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'adding a new project', {:type => :feature} do
  it 'allows a user to add a new project to the database' do
    visit '/'
    click_link 'Add project'
    fill_in('title', :with => 'Horses')
    click_button 'Create Project'
    expect(page).to have_content 'Horses'
  end
end

describe 'updating a project title', {:type => :feature} do
  it 'allows user to change project title' do
    visit '/'
    click_link 'Horses'
    fill_in('title', with: => 'Equines')
    expect(page).to have_content 'Equines'
  end
end

describe 'adding a volunteer and assigning a project', {:type => :feature} do
  it 'allows user to add a new volunteer to the database with an associated project id' do
    visit '/'
    click_link 'Add volunteer'
    fill_in('volunteer_name', :with => 'Sam Bob')
    fill_in('project_id', :with => 'Horses')
    click_button 'Creat Volunteer'
    expect(page).to have_content 'Sam Bob'
  end
end

describe 'updating a volunteer name', {:type => :feature} do
  it 'allows user to change volunteer name' do
    visit '/'
    click_link 'Horses'
    fill_in('volunteer_name', with: => 'Sam Bill')
    expect(page).to have_content 'Sam Bill'
  end
end

describe 'deleting a volunteer', {:type => :feature} do
  it 'allows user to delete a volunteer' do
    visit '/'
    click_link 'Sam Bill'
    click_button 'Delete Volunteer'
    expect(page).to have_content ''
  end
end

describe 'deleting a project', {:type => :feature} do
  it 'allows user to delete a project' do
    visit '/'
    click_link 'Equines'
    click_button 'Delete Volunteer'
    expect(page).to have_content ''
  end
end
