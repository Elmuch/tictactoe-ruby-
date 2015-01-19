require './lib/board'
require 'spec_helper'

RSpec.describe Board do
  let(:board) { Board.new}

  it "should create a board instance without errors" do
    expect { board }.to_not raise_error
  end

  it "The board matrix should contain 3 columns" do
    expect(board.matrix.size).to eq(3)
  end

  it"should return false when the matrix is empty" do
    board.matrix = Array.new(3){Array.new(3){ 0 }}
    expect(board.has_full_board?).to equal(false)
  end

  it"should return true when the matrix is empty" do
    board.matrix = Array.new(3){Array.new(3){ 0 }}
    expect(board.empty_board?).to equal(true)
  end

  it "should return value at a given cordinate" do
    board.update_element(1,0,"X")
    expect(board.get_element(1,0)).to eq("X")
  end
end
