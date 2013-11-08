RSpec API Expectations
======================

RSpecApi::Expectations provides the `expect_resourceful` helper to any
RSpec example group tagged as `:rspec_api_resource`.

[![Build Status](https://travis-ci.org/rspec-api/rspec-api-expectations.png?branch=master)](https://travis-ci.org/rspec-api/rspec-api-expectations)
[![Code Climate](https://codeclimate.com/github/rspec-api/rspec-api-expectations.png)](https://codeclimate.com/github/rspec-api/rspec-api-expectations)
[![Coverage Status](https://coveralls.io/repos/rspec-api/rspec-api-expectations/badge.png)](https://coveralls.io/r/rspec-api/rspec-api-expectations)
[![Dependency Status](https://gemnasium.com/rspec-api/rspec-api-expectations.png)](https://gemnasium.com/rspec-api/rspec-api-expectations)

Basic example
-------------

    require 'faraday'
    response = Faraday.new('http://example.com/').get('/concerts')

    describe 'GET http://example.com/concerts', :rspec_api_resource do
      expect_resourceful response, status: :ok, type: :json, array: true
    end

The example above makes a `GET `'http://example.com/concerts'` request, then
check that the response:

* has a status code of 200 OK
* has the 'Content-Type' header set to 'application/json'
* has a JSON Array of Hashes (also called 'objects') in the body

Running the test above in RSpec produces the following output:

...

Available expectations
======================

The purpose of RSpecApi::Expectations is to give developers a tool to quickly
test that API endpoints respect some best practices that are common to
RESTful resourceful web APIs.

A list of best practices is available in [this great article by ...]; they
span from something as simple as "the status of a successful GET request should
be 200 OK" to something more complex as "the headers of a GET request for a
paginated list should include a link to the previous page".

RSpecApi::Expectations makes it easy to test whether any web API respects these
best practices by means of the `expect_resourceful` method. Here are all the
available expectations that can be tested with this method:

Status
------

    expect_resourceful response, status: :ok

Expects a specific HTTP status code in the response.
The status can be specified either as a number or as a [symbol](...)

Content Type
------------

    expect_resourceful response, type: :json

Expects a specific 'Content-Type' header in the response.
The status can be specified either as a string or as a [symbol](...).
By default, the expectation (best practice) is 'application/json'.
Note that this expectation always passes if the response status indicates
that there is no content at all (e.g. if the status is '204 No Content').

Collection
----------

    expect_resourceful response, collection: true

Expects the response body to either contain one or a collection of resources.
By default, the expectation is `collection: false`.

An example of a JSON response with one resource is:
`{"id": 1, "name": "foo"}`.
An example of a JSON response with a collection of resources is:
`[{"id": 1, "name": "foo"}, {"id": 2, "name": "bar"}]`.

More to add
-----------

  ....


How to install
==============

Add `gem 'rspec-api-expectations'` to your `Gemfile` and run `bundle`.
Or install yourself by running `gem install rspec-api-expectations`.

Version changes respect [Semantic Versioning](http://semver.org).
To ensure `bundle update` won't cause problems in your repository,
always indicate the patch version until version 1.0.0 is released, e.g.:

    gem 'rspec-api-expectations', '~> 0.5.0'

How to contribute
=================

Don’t hesitate to send me code comments, issues or pull requests through GitHub!
All feedback is appreciated. Thanks :)