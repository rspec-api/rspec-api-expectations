require 'spec_helper'
require 'rspec-api/expectations'

describe 'expect_response' do
  context 'given any expectation on the status' do
    let(:examples) { examples_expecting status: 200 }
    it 'runs expectations for the response status' do
      expect(examples).to include_description 'responds with a status code that'
    end
  end

  context 'given no expectations on the status' do
    let(:examples) { examples_expecting something_not: :in_status }
    it 'does not run expectations for the response status' do
      expect(examples).not_to include_description 'responds with a status code that'
    end
  end

  context 'given any expectation on the headers' do
    let(:examples) { examples_expecting type: :json }
    it 'runs expectations for the response headers' do
      expect(examples).to include_description 'responds with headers that'
    end
  end

  context 'given no expectations on the headers' do
    let(:examples) { examples_expecting something_not: :in_headers }
    it 'does not run expectations for the response headers' do
      expect(examples).not_to include_description 'responds with headers that'
    end
  end

  context 'given any expectation on the body' do
    let(:examples) { examples_expecting collection: true }
    it 'runs expectations for the response body' do
      expect(examples).to include_description 'responds with a body that'
    end
  end

  context 'given no expectations on the body' do
    let(:examples) { examples_expecting something_not: :in_body }
    it 'does not run expectations for the response body' do
      expect(examples).not_to include_description 'responds with a body that'
    end
  end

  context 'given a block' do
    let(:examples) { examples_expecting(status: :ok) { } }
    it 'runs expectations for the response body' do
      expect(examples).to include_description 'matches custom expectations'
    end
  end

  context 'given no block' do
    let(:examples) { examples_expecting no: :blocks }
    it 'does not run expectations for the response body' do
      expect(examples).not_to include_description 'matches custom expectations'
    end
  end
end