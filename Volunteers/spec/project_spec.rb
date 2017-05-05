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

  describe '#name' do
    it 'returns project name' do
      project = (Project.new(:name => 'Horses', :description => 'feed the horses', :id => nil))
      expect(project.name).to eq('Horses')
    end
  end
end
