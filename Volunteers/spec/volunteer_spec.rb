require 'rspec'
require 'spec_helper'
require 'volunteer'
require 'pg'

describe Volunteer do

  describe '#name' do
    it 'adds volunteer name' do
      expect(Volunteer.new(:name => 'Sam Bob', :project_id=> 1).name).to eq('Sam Bob')
    end
  end

  describe '#project_id' do
    it 'adds volunteer project_id' do
      expect(Volunteer.new(:name => 'Sam Bob', :project_id=> 1).project_id).to eq(1)
    end
  end

  describe '.all' do
    it 'starts off with no volunteers' do
      expect(Volunteer.all).to eq([])
    end
  end

  describe '#==' do
    it 'is the same volunteer if they have the same name and project id' do
      volunteer1 = Volunteer.new(:name => 'Sam Bob', :project_id=> 1)
      volunteer2 = Volunteer.new(:name => 'Sam Bob', :project_id=> 1)
      expect(volunteer1).to eq(volunteer2)
    end
  end

  describe '#save' do
    it 'adds a volunteer to the  volunteers array' do
    volunteer = Volunteer.new(:name => 'Sam Bob', :project_id => 1)
    volunteer.save
    expect(Volunteer.all).to eq([volunteer])
    end
  end
end
