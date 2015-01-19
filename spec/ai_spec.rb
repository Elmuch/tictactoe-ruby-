require './lib/ai'
require './lib/board'
require 'spec_helper'

RSpec.describe Ai do
  before :each do
    @board = Board.new
  end
  it "creates an Ai without an error" do
    expect { Ai.new(@board,1) }.to_not raise_error
  end

  xit "should always get the best move" do
  end
end
