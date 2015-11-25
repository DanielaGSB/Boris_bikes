require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike}

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#dock' do
    it 'raises error when docking station is full' do
      bike = Bike.new
      subject.dock(bike)
      expect {subject.dock(bike)}.to raise_error
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises error when no bikes available' do
      expect {subject.release_bike}.to raise_error
    end

    it 'releases working bikes' do
      bike = Bike.new
      expect(bike).to be_working
    end
  end

end
