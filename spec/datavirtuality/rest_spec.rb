# frozen_string_literal: true

describe DataVirtuality::Rest, :vcr do
  subject(:client) { described_class.new(ENV['DV_HOST'], ENV['DV_USER_NAME'], ENV['DV_PASSWORD']) }

  describe '#status' do
    it 'returns server status' do
      expect(client.status).to eq(:ok)
    end
  end

  describe '#data_sources' do
    it 'returns data sources' do
      expect(client.data_sources).to eq(%w[SYS SYSADMIN UTILS pg_catalog views minter_examples similarweb similarweb_examples])
    end
  end

  describe '#get' do
    let(:existing_table) { 'SYS/VirtualDatabases' }
    let(:nonexisting_table) { 'Something/Does/Not/Exist' }

    it 'returns all rows of a given table' do
      expect(client.get(existing_table)).to eq([{ Name: 'datavirtuality', Version: '1' }])
    end

    it 'throws an exception' do
      expect { client.get(nonexisting_table) }.to raise_error(DataVirtuality::RestException)
    end
  end

  describe '#query' do
    let(:correct_query) { 'SELECT * FROM SYS.VirtualDatabases' }
    let(:incorrect_query) { 'SELECT * FROM SYS.DoesNotExist' }

    it 'returns all rows of a given query' do
      expect(client.query(correct_query)).to eq([{ Name: 'datavirtuality', Version: '1' }])
    end

    it 'throws an exception' do
      expect { client.query(incorrect_query) }.to raise_error(DataVirtuality::RestException)
    end
  end
end
