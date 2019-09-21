# frozen_string_literal: true

require 'spec_helper'

describe Trackplus::Client do
  let(:client) { described_class.new(api_key: 'test', max_retries: 1) }
  let(:headers) { { 'Authorization' => 'Bearer test', 'User-Agent' => 'Trackplus Ruby Client' } }

  describe '#new' do
    it 'raises an error on missing api_key' do
      expect { described_class.new }.to raise_error(Trackplus::Errors::InvalidConfiguration)
    end

    it 'creates new instance when all required arguments are provided' do
      expect(described_class.new(api_key: 'key')).to be_kind_of(described_class)
    end
  end

  describe '#trackings' do
    it 'returns tracking details' do
      stub_request(:get, 'http://167.71.238.124/api/v1/trackings/airwings/202315836553')
        .to_return(status: 200, body: trackings_json_fixture)
      expect(client.tracking(courier: 'airwings', tracking_no: '202315836553')).to be_kind_of(Hash)
      expect(client.tracking(courier: 'airwings', tracking_no: '202315836553')['checkpoints']).to be_kind_of(Array)
      expect(client.tracking(courier: 'airwings', tracking_no: '202315836553')['checkpoints'][0]).to eq(
        'checkpoint_at' => '2018-07-23T06:21:39Z',
        'courier' => 'aramex',
        'message' => 'Shipment information sent to FedEx',
        'add_location' => nil,
        'add_city' => nil,
        'add_country' => nil,
        'add_state' => nil,
        'add_zip' => nil,
        'state' => 'info_received',
        'created_at' => '2019-09-09T17:09:11Z',
        'updated_at' => '2019-09-09T17:09:11Z'
      )
    end

    it 'timout error handling' do
      stub_request(:get, 'http://167.71.238.124/api/v1/trackings/airwings/202315836553')
        .to_timeout
      expect{client.tracking(courier: 'airwings', tracking_no: '202315836553')}.to raise_error(Trackplus::Errors::MaxRetriesExceeded)
    end
  end

  describe '#couriers' do
    it 'returns available couriers details' do
      stub_request(:get, 'http://167.71.238.124/api/v1/couriers')
        .to_return(status: 200, body: couriers_json_fixture)

      expect(client.couriers).to be_kind_of(Array)
      expect(client.couriers[0]).to be_kind_of(String)
    end
  end
end
