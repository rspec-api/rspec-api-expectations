require 'spec_helper'

describe 'expect_resourceful', sandboxing: true do
  context 'given the body is a collection and the :collection option is true' do
    let(:response) { resourceful_response body: '[]' }
    before { @group = resourceful_examples response, collection: true }
    it { expect(run_examples @group).to pass }
  end

  context 'given the body is a collection and the :collection option is false' do
    let(:response) { resourceful_response body: '[]' }
    before { @group = resourceful_examples response, collection: false }
    it { expect(run_examples @group).not_to pass }
  end

  context 'given the attributes in the body match the :attributes option' do
    let(:response) { resourceful_response body: '[{"id": 1}, {"id": 2}]' }
    before { @group = resourceful_examples response, collection: true, attributes: {id: {type: {number: :integer}}} }
    it { expect(run_examples @group).to pass }
  end

  context 'given the attributes in the body do not match the :attributes option' do
    let(:response) { resourceful_response body: '[{"id": 1}, {"id": 2}]' }
    before { @group = resourceful_examples response, collection: true, attributes: :token }
    it { expect(run_examples @group).not_to pass }
  end


  context 'given the body is sorted by the :sorting attribute' do
    let(:response) { resourceful_response body: '[{"id": 2}, {"id": 3}]' }
    before { @group = resourceful_examples response, collection: true, sort: {by: :id} }
    it { expect(run_examples @group).to pass }
  end

  context 'given the body is sorted by the :sort attribute + verse' do
    let(:response) { resourceful_response body: '[{"id": 3}, {"id": 2}]' }
    before { @group = resourceful_examples response, collection: true, sort: {by: :id, verse: :desc} }
    it { expect(run_examples @group).to pass }
  end

  context 'given the body is not sorted by the :sorting attribute' do
    let(:response) { resourceful_response body: '[{"id": 3}, {"id": 2}]' }
    before { @group = resourceful_examples response, collection: true, sort: {by: :id} }
    it { expect(run_examples @group).not_to pass }
  end


  context 'given the body is filtered by the :filter attribute' do
    let(:response) { resourceful_response body: '[{"id": 2}, {"id": 2}]' }
    before { @group = resourceful_examples response, collection: true, filter: {by: :id, value: 2} }
    it { expect(run_examples @group).to pass }
  end

  context 'given the body is not filtered by the :filter attribute' do
    let(:response) { resourceful_response body: '[{"id": 2}, {"id": 3}]' }
    before { @group = resourceful_examples response, collection: true, filter: {by: :id, value: 2} }
    it { expect(run_examples @group).not_to pass }
  end

  context 'given the body is wrapped by the :callback attribute' do
    let(:response) { resourceful_response body: 'method({"id": 1})' }
    before { @group = resourceful_examples response, callback: :method }
    it { expect(run_examples @group).to pass }
  end

  context 'given the body is not wrapped by the :callback attribute' do
    let(:response) { resourceful_response body: '[{"id": 3}, {"id": 2}]' }
    before { @group = resourceful_examples response, callback: :method }
    it { expect(run_examples @group).not_to pass }
  end
end