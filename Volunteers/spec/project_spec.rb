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
      expect((Project.new(:name => 'Horses', :description => 'feed the horses', :id => nil)).name).to eq('Horses')
    end
  end

  describe '#description' do
    it 'returns project description' do
      expect((Project.new(:name => 'Horses', :description => 'feed the horses', :id => nil)).description).to eq('feed the horses')
    end
  end
end
