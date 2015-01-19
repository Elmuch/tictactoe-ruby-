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
    @ai.set_best_move(moves, scores, turn)
    expect(@ai.set_score_of_path(scores)).to eq(11)
    expect(@ai.best_move).to eq([1,1])
  end
end
