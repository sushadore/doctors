require 'rspec'
require 'spec_helper'
require 'project'
require 'volunteer'
require 'pg'

describe Project do

  describe '#title' do
    it 'adds project title' do
      expect(Project.new(:title => 'Horses', :id => nil).title).to eq('Horses')
    end
  end

  describe '#id' do
    it 'sets project ID' do
      expect(Project.new(:title => 'Horses', :id => 1).id).to be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'starts off with no projects' do
    expect(Project.all).to eq([])
    end
  end

  describe '#==' do
    it 'is the same project if it has the same title' do
      project1 = Project.new(:title => 'Horses', :id => 1)
      project2 = Project.new(:title => 'Horses', :id => 1)
      expect(project1).to eq(project2)
    end
  end

  describe 'save' do
    it 'adds a project to the projects array' do
      project = Project.new(:title => 'Horses', :id => 1)
      project.save
      expect(Project.all).to eq([project])
    end
  end

  describe '#update' do
    it 'changes project title in the database' do
      project = Project.new(:title => 'Horses', :id => nil)
      project.save
      project.update(:title => 'Ponies')
      expect(project.title).to eq('Ponies')
    end
  end

  describe '#delete' do
    it 'deletes a project from the database' do
      project1 = Project.new(:title => 'Horses', :id => nil)
      project1.save
      project2 = Project.new(:title => 'Dogs', :id => nil)
      project2.save
      project1.delete
      expect(Project.all).to eq([project2])
    end
  end

  describe '.find' do
    it 'finds a project by its id' do
      project1 = Project.new(:title => 'Horses', :id => nil)
      project1.save
      project2 = Project.new(:title => 'Dogs', :id => nil)
      project2.save
      expect(Project.find(project2)).to eq(project2)
    end
  end
end
