require 'capybara/rspec'
require '.app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'adding a new project', {:type => :feature} do
  it'allows a user to add a new project to the database' do
    visit '/'
    click_link 'Add project'
    fill_in('title', :with => 'Horses')
    expect(page).to have_content 'Horses'
  end
end

describe 'adding a volunteer and assigning a project', {:type => :feature} do
  it 'allows user to add a new volunteer to the database with an associated project id' do
    visit '/'
    click_link 'Add volunteer'
    fill_in('volunteer_name', :with => 'Sam Bob')
    fill_in('project_id', :with => 'Horses')
    expect(page).to have_content 'Sam Bob'
  end
end

describe 'updating a project name', {:type => :feature} do
  it 'allows user to chang project name' do
    visit '/'
    click_link 'Horses'
    fill_in('title', with: => 'Equines')
    expect(page).to have_content 'Equines'
  end
end

describe
