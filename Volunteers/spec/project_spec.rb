require 'rspec'
require 'spec_helper'
require 'project'
require 'pg'

describe Project do

  describe '.all' do
    it 'starts off with no projects' do
    expect(Project.all).to eq([])
    end
  end

  describe '#title' do
    it 'adds project title' do
      expect(Project.new(:title => 'Horses', :description => 'feed the horses', :id => nil).title).to eq('Horses')
    end
  end

  describe '#description' do
    it 'adds project description' do
      expect(Project.new(:title => 'Horses', :description => 'feed the horses', :id => nil).description).to eq('feed the horses')
    end
  end

  describe '#id' do
    it 'sets project ID' do
      expect(Project.new(:title => 'Horses', :description => 'feed the horses', :id => 1).id).to be_an_instance_of Fixnum
    end
  end

  describe '#==' do
    it 'is the same project if it has the same title' do
      project1 = Project.new(:title => 'Horses', :description => 'feed the horses', :id => 1)
      project2 = Project.new(:title => 'Horses', :description => 'feed the horses', :id => 1)
      expect(project1).to eq(project2)
    end
  end

  # describe 'save' do
  #   it 'lets you save projects to the database' do
  #     project = Project.new(:title => 'Horses', :description => 'feed the horses', :id => 1)
  #     project.save
  #     expect(Project.all).to eq([project])
  #   end
  # end
end
