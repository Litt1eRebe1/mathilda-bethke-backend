require_relative './../app/application_report'

RSpec.describe ApplicationReport do
  let(:service) { described_class.new('applications.json') }

  describe 'when channel set to :all' do
    let(:expected_response) do
      {
        0 => 1,
        1 => 3,
        2 => 2,
        3 => 3,
        4 => 1,
        5 => 2,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 4,
        10 => 3,
        11 => 4,
        12 => 3,
        13 => 4,
        14 => 2,
        15 => 3,
        16 => 2,
        17 => 3,
        18 => 3,
        19 => 3,
        20 => 3,
        21 => 4,
        22 => 1,
        23 => 3
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
        2 => 1,
        3 => 1,
        4 => 0,
        5 => 1,
        6 => 0,
        7 => 0,
        8 => 1,
        9 => 1,
        10 => 2,
        11 => 2,
        12 => 2,
        13 => 0,
        14 => 1,
        15 => 1,
        16 => 1,
        17 => 1,
        18 => 1,
        19 => 1,
        20 => 2,
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
        0 => 0,
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 0,
        6 => 0,
        7 => 1,
        8 => 0,
        9 => 2,
        10 => 0,
        11 => 1,
        12 => 1,
        13 => 2,
        14 => 1,
        15 => 1,
        16 => 1,
        17 => 1,
        18 => 0,
        19 => 1,
        20 => 0,
        21 => 2,
        22 => 1,
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
        0 => 0,
        1 => 1,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 1,
        6 => 0,
        7 => 0,
        8 => 0,
        9 =>1,
        10 => 1,
        11 => 2,
        12 => 1,
        13 => 2,
        14 => 1,
        15 => 1,
        16 => 0,
        17 => 1,
        18 => 2,
        19 => 1,
        20 => 1,
        21 => 2,
        22 => 0,
        23 => 1
      }
    end

    it 'returns proper response' do
      expect(service.retrieve_trend("qr")).to eq(expected_response)
    end
  end
end
