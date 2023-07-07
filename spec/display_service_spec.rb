require_relative './../app/display_service'

RSpec.describe DisplayService do
  let(:service) { described_class.new("applications.json") }

  describe 'when calling valid_choices function' do
    let(:expected_response) do
        [ "all", "sales", "website", "qr", "0", "1", "2", "3"]
    end

    it 'should return the expected values' do
      expect(service.valid_choices).to eq(expected_response)
    end
  end

  describe 'when calling invalid_selection function' do
    let(:expected_response) do
        "Invalid selection\n"
    end

    it 'should return the expected value' do
      expect(service.invalid_selection).to eq(expected_response)
    end
  end

  describe 'when calling terminating_character function' do
    let(:expected_response) do
        "-99"
    end

    it 'should return the expected value' do
      expect(service.terminating_character).to eq(expected_response)
    end
  end

  describe 'when calling end_of_execution function' do
    let(:expected_response) do
        "Exiting application\n"
    end

    it 'should return the expected value' do
      expect(service.end_of_execution).to eq(expected_response)
    end
  end
end
