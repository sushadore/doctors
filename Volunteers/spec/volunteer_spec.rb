require 'rspec'
require 'spec_helper'
require 'volunteer'
require 'pg'

describe Volunteer do

  describe '#name' do
    it 'adds volunteer name' do
      expect(Volunteer.new(:name => 'Sam Bob', :id=> nil).name).to eq('Sam Bob')
    end
  end

  describe '#id' do
    it 'adds volunteer id' do
      expect(Volunteer.new(:name => 'Sam Bob', :id=> nil).id).to eq(nil)
    end
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Volunteer.all).to eq([])
    end
  end

  describe '#==' do
    it 'is the same volunteer if they have the same name and ID' do
      volunteer1 = Volunteer.new(:name => 'Sam Bob', :id=> 1
      volunteer2 = Volunteer.new(:name => 'Sam Bob', :id=> 1
      expect(volunteer1).to eq(volunteer2)
    end
  end
end
