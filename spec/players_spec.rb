require './lib/players'
require './lib/ai'
require './lib/human'
require './lib/board'
require 'spec_helper'

RSpec.describe Players do
  before :each do
    @board = Board.new
    @player_1 = Human.new(@board,"")
    @player_2 = Ai.new(@board,-1)
  end
  let(:players){ Players.new(@board, @player_1, @player_2) }

  it "creates a players instance without an error" do
    expect { players }.to_not raise_error
  end

  it "intialization should not modify @player_turn" do
    expect(players.turn).to eq(1)
  end

  it "should switch the turns" do
    players.switch_turns
    expect(players.turn).to eq(-1)
  end

  xit "should set the move for player" do
    # TODO
  end
end
