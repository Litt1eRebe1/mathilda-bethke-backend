require_relative './../app/application_report'

# The test were updated since they failed when the values were strictly rounded up, but instead were testing for the values being rounded down.
RSpec.describe ApplicationReport do
  let(:service) { described_class.new('applications.json') }

  describe 'when channel set to :all' do
    let(:expected_response) do
      {
        0 => 2,
        1 => 3,
        2 => 3,
        3 => 3,
        4 => 1,
        5 => 2,
        6 => 1,
        7 => 2,
        8 => 2,
        9 => 5,
        10 => 3,
        11 => 5,
        12 => 4,
        13 => 5,
        14 => 3,
        15 => 3,
        16 => 2,
        17 => 4,
        18 => 3,
        19 => 3,
        20 => 4,
        21 => 5,
        22 => 2,
        23 => 4
      }
    end

    it 'returns proper response' do
      expect(service.retrieve_trend("all")).to eq(expected_response)
    end
  end

  describe 'when channel set to :sales' do
    let(:expected_response) do
      {
        0 => 1,
        1 => 1,
        2 => 2,
        3 => 2,
        4 => 0,
        5 => 1,
        6 => 1,
        7 => 0,
        8 => 1,
        9 => 2,
        10 => 2,
        11 => 2,
        12 => 2,
        13 => 1,
        14 => 1,
        15 => 1,
        16 => 1,
        17 => 1,
        18 => 1,
        19 => 1,
        20 => 3,
        21 => 1,
        22 => 0,
        23 => 1
      }
    end

    it 'returns proper response' do
      expect(service.retrieve_trend("sales")).to eq(expected_response)
    end
  end

  describe 'when channel set to :website' do
    let(:expected_response) do
      {
        0 => 1,
        1 => 2,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 2,
        10 => 1,
        11 => 1,
        12 => 1,
        13 => 2,
        14 => 1,
        15 => 1,
        16 => 1,
        17 => 2,
        18 => 0,
        19 => 1,
        20 => 1,
        21 => 2,
        22 => 2,
        23 => 1
      }
    end

    it 'returns proper response' do
      expect(service.retrieve_trend("website")).to eq(expected_response)
    end
  end

  describe 'when channel set to :qr' do
    let(:expected_response) do
      {
        0 => 1,
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 1,
        7 => 1,
        8 => 0,
        9 => 2,
        10 => 1,
        11 => 2,
        12 => 1,
        13 => 2,
        14 => 1,
        15 => 1,
        16 => 1,
        17 => 1,
        18 => 2,
        19 => 2,
        20 => 1,
        21 => 2,
        22 => 0,
        23 => 2
      }
    end

    it 'returns proper response' do
      expect(service.retrieve_trend("qr")).to eq(expected_response)
    end
  end
end
