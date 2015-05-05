require_relative '../game_of_life'

# These initial tests should fail
# All tests work with a 3x3 board
describe World do
  let(:world) { World.new(3) }

  it "should instantiate with the size provided" do
    expect(world.size).to be 3
  end

  it "should have first row of cells" do
    expect(world.cells[0].length).to be 3
  end

  describe '#get_neighbors' do
    it 'for 1,1 should return an array of 8 cells' do
      expect(world.get_neighbors(1,1).length).to be 8
    end
  end

  describe '#alive_next_turn?' do
    context 'living cell' do
      before do
        world.set_alive(1,1)
      end

      it 'stays alive if it has 2 or 3 neighbors' do
        world.set_alive(0,0)
        world.set_alive(0,1)
        expect(world.alive_next_turn?(1,1)).to be true

        world.set_alive(0,-1)
        expect(world.alive_next_turn?(1,1)).to be true
      end

      it 'dies if doesnt have 2 or 3 neighbors' do
        expect(world.alive_next_turn?(1,1)).to be false
      end
    end

    context 'dead cell' do
      it 'comes to life if it has 3 neighbors' do

      end

      it 'stays dead if it does not have 3 neighbors'
    end
  end
end
