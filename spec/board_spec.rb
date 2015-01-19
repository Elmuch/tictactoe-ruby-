require './lib/board'
require 'spec_helper'

RSpec.describe Board do
  let(:board) { Board.new}

  it "creates a board instance without errors" do
    expect { board }.to_not raise_error
  end

end
