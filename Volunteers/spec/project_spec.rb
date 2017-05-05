require 'rspec'
require 'spec_helper'
require 'project'
require 'pg'

describe Project do

  describe '.all' do
    it 'starts off with no projects' do
    expect(Project.all).to(eq([]))
    end
  end
end
