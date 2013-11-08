require 'spec_helper'

describe 'expect_resourceful' do
  context 'not given the the :status option' do
    before { @examples = resourceful_examples resourceful_response }
    it 'does not run expectations for the response status' do
      expect(descriptions_for @examples).not_to include 'responds with a status code that'
    end
  end

  context 'given the :status option' do
    before { @examples = resourceful_examples resourceful_response, status: :any }
    it 'runs expectations for the response status' do
      expect(descriptions_for @examples).to include 'responds with a status code that'
    end
  end

  context 'not given the :type option' do
    before { @examples = resourceful_examples resourceful_response}
    it 'does not run expectations for the response headers' do
      expect(descriptions_for @examples).not_to include 'responds with headers that'
    end
  end

  context 'given the :type option' do
    before { @examples = resourceful_examples resourceful_response, type: :any }
    it 'runs expectations for the response headers' do
      expect(descriptions_for @examples).to include 'responds with headers that'
    end
  end

  context 'not given the :collection option' do
    before { @examples = resourceful_examples resourceful_response}
    it 'does not run expectations for the response headers' do
      expect(descriptions_for @examples).not_to include 'responds with a body that'
    end
  end

  context 'given the :collection option' do
    before { @examples = resourceful_examples resourceful_response, collection: :any }
    it 'runs expectations for the response headers' do
      expect(descriptions_for @examples).to include 'responds with a body that'
    end
  end
end