require './lib/human'
require './lib/board'
require 'spec_helper'

RSpec.describe Human do
  before :each do
    @board = Board.new
  end
  it "creates a Human player instance without an error" do
    expect { Human.new(@board,1) }.to_not raise_error
  end
end
