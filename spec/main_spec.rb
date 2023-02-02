# frozen_string_literal: true

require './lib/main'

describe Game do

    describe '#game_over' do
    subject(:game_won) { described_class.new }
    let(:player) { instance_double(Player) }

        context 'player wins when he has 3 in a row on top of the board'
        it 'returns @game_over as true when the player combination matches the top row combination' do
            allow(player).to receive()
            @current_player.player_arr = [6, 7, 8]
            result = game_won.game_over
            expect(result).to be true
        end
    end
end