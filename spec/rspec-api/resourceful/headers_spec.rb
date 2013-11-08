require 'spec_helper'

describe 'expect_resourceful', sandboxing: true do

  context 'given the Content-Type header matches the :type option' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, type: :json }
    it { expect(run_examples @group).to pass }
  end

  context 'given the Content-Type header does not match the :type option' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, type: :not_json }
    it { expect(run_examples @group).not_to pass }
  end

  context 'given no Link header and an expectation of no pages' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, has_prev_page: false }
    it { expect(run_examples @group).to pass }
  end

  context 'given no Link header and an expectation of a prev page' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, has_prev_page: true }
    it { expect(run_examples @group).not_to pass }
  end

  context 'given a prev Link header and an expectation of a prev page' do
    let(:response) { resourceful_response headers: {'Link' => '<https://example.com/1>; rel="prev"'} }
    before { @group = resourceful_examples response, has_prev_page: true }
    it { expect(run_examples @group).to pass }
  end

  context 'given a next Link header and an expectation of a prev page' do
    let(:response) { resourceful_response headers: {'Link' => '<https://example.com/3>; rel="next"'} }
    before { @group = resourceful_examples response, has_prev_page: true }
    it { expect(run_examples @group).not_to pass }
  end

  context 'given a next Link header and no expectation of a prev page' do
    let(:response) { resourceful_response headers: {'Link' => '<https://example.com/3>; rel="next"'} }
    before { @group = resourceful_examples response, has_prev_page: false }
    it { expect(run_examples @group).to pass }
  end
end