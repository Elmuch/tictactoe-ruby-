require './lib/tictactoe'
require './lib/board'
require 'spec_helper'

RSpec.describe Tictactoe do
  before :each do
    @board = Board.new
  end
  it "should create a Human player instance without an error" do
    expect { Tictactoe.new(@board) }.to_not raise_error
  end
end
