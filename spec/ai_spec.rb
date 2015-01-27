require './lib/ai'
require './lib/board'
require 'spec_helper'

RSpec.describe Ai do
  before :each do
    @board = Board.new
    @ai = Ai.new(@board,1)
  end
  it "should create an instance of Ai without an error" do
    expect { Ai.new(@board,1) }.to_not raise_error
  end

  it "should always get the best move" do
    moves = [[0,0],[1,1],[2,1]]
    scores = [8,-1,4]
    turn = -1
    @ai.get_move # A stub would be used here, takes forever
    expect(@ai.best_move).to eq([2,2])
  end
end
