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

  describe 'adding a new volunteer', {:type => :feature} do
    it 'allows user to add a new volunteer to the database' do
      visit '/'
      click_link 'Add volunteer'
      fill_in('name', :with => 'Sam Bob')
      expect(page).to have_content 'Sam Bob'
    end
  end
