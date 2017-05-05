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
end
