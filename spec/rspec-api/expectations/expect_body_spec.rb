require 'spec_helper'
require 'rspec-api/expectations'

describe 'expect_body', sandboxing: true do
  context 'given the right expectation on the response body being a collection' do
    let(:examples) { examples_expecting collection: true }
    it { expect(examples).to pass }
  end

  context 'given the wrong expectation on the response body being a collection' do
    let(:examples) { examples_expecting collection: false }
    it { expect(examples).not_to pass }
  end

  context 'given the right expectation on the response body wrapped in a callback' do
    let(:examples) { examples_expecting callback: 'alert' }
    it { expect(examples).to pass }
  end

  context 'given the right expectation on the response body wrapped in a callback' do
    let(:examples) { examples_expecting callback: 'the_wrong_one' }
    it { expect(examples).not_to pass }
  end

  context 'given the right expectation on the sorting of the response body' do
    let(:examples) { examples_expecting sort: {by: :id, verse: :asc} }
    it { expect(examples).to pass }
  end

  context 'given the right expectation on the sorting of the response body' do
    let(:examples) { examples_expecting sort: {by: :id, verse: :desc} }
    it { expect(examples).not_to pass }
  end

  context 'given the right expectation on the filter of the response body' do
    let(:examples) { examples_expecting filter: {by: :name, value: 'foo'} }
    it { expect(examples).to pass }
  end

  context 'given the right expectation on the filter of the response body' do
    let(:examples) { examples_expecting filter: {by: :name, value: 'bar'} }
    it { expect(examples).not_to pass }
  end

  context 'given the right expectation on the attributes of the response body' do
    let(:examples) { examples_expecting attributes: {id: {type: {number: :integer}}} }
    it { expect(examples).to pass }
  end

  context 'given the right expectation on the attributes of the response body' do
    let(:examples) { examples_expecting attributes: {id: {type: :string}} }
    it { expect(examples).not_to pass }
  end
end