require './lib/human'
require './lib/board'
require 'spec_helper'

RSpec.describe Human do
  before :each do
    @board = Board.new
  end

  it "should create a Human player instance without an error" do
    expect { Human.new(@board) }.to_not raise_error
  end
end
