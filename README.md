RSpec API Expectations
======================

RSpecApi::Expectations lets you express expectations on the response of web APIs:

    expect_response response, status: :ok, type: :json, collection: true

More documentation and examples about RSpecApi are available at [http://rspec-api.github.io](http://rspec-api.github.io)

[![Build Status](https://travis-ci.org/rspec-api/rspec-api-expectations.png?branch=master)](https://travis-ci.org/rspec-api/rspec-api-expectations)
[![Code Climate](https://codeclimate.com/github/rspec-api/rspec-api-expectations.png)](https://codeclimate.com/github/rspec-api/rspec-api-expectations)
[![Coverage Status](https://coveralls.io/repos/rspec-api/rspec-api-expectations/badge.png)](https://coveralls.io/r/rspec-api/rspec-api-expectations)
[![Dependency Status](https://gemnasium.com/rspec-api/rspec-api-expectations.png)](https://gemnasium.com/rspec-api/rspec-api-expectations)

Basic example
-------------

    # 1. Make a request to the GitHub API:

    require 'faraday'
    conn = Faraday.new 'https://api.github.com/' do |c|
      c.use Faraday::Adapter::NetHttp
    end
    conn.headers[:user_agent] = 'RSpec API'
    conn.authorization :token, ENV['RSPEC_API_GITHUB_TOKEN']
    response = conn.get '/repositories'

    # 2. Expect the response to be successful and to return a JSON collection,
    #    where each object has an ID key/value (number), a name key/value
    #    (string) and a url key/value (string in URL format)

    require 'rspec-api/expectations'

    describe 'List all public repositories', rspec_api: true do
      expect_response response, status: :ok, type: :json, collection: true,
        attributes: {id: {type: :number}, name: {type: :string},
                     url: {type: {string: :url}}}

Running the example above returns the following successful output:

    GET https://api.github.com/repositories
      responds with a status code that
        should be 200
      responds with headers that
        should include 'Content-Type': 'application/json; charset=utf-8'
      responds with a body that
        should be a collection
        should have attributes {:id=>{:type=>:number}, :name=>{:type=>:string}, :url=>{:type=>{:string=>:url}}}

    Finished in 0.13086 seconds
    4 examples, 0 failures

Note that, in order run the example, above, you need to get a GitHub Personal Access Token:

* Browse to your [GitHub settings](https://github.com/settings/applications)
* Click on 'Create new token' under 'Personal Access Token' (name it as you want)
* Copy the generated token and store it on your machine as the environment variable called `RSPEC_API_GITHUB_TOKEN`:
* On OSX and bash, accomplish this by running the command `export RSPEC_API_GITHUB_TOKEN=` followed by your pasted key (no spaces after `=`)


Available expectations
======================

The purpose of RSpecApi::Expectations is to give developers a tool to quickly
test that API endpoints respect some [best practices](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
that are common to RESTful resourceful web APIs.

Status
------

    expect_response response, status: :ok

Expects a specific HTTP status code in the response.
The status can be specified either as a number (200) or as a symbol (:ok).

Content Type
------------

    expect_response response, type: :json

Expects a specific 'Content-Type' header in the response.
The status can be specified either as a string or as a symbol.
The expectation always passes when the response does not have a content
(e.g. if the status is '204 No Content').


Page Links
----------

    expect_response response, page_links: true

Expects a 'Link' header in the response to denote pagination, in accordance to [RFC 5988](http://tools.ietf.org/html/rfc5988#page-6).
The expectation passes if a link with rel="prev" is found.

Collection
----------

    expect_response response, collection: true

Expects a collection of JSON objects in the response body.
For example, the expectation above passes if the body is
`[{"name":"foo"},{"name":"bar"}]`.

JSONP Callback
--------------

    expect_response response, callback: 'alert'

Expects a response body with a JSON wrapped in the given JSONP callback.
For example, the expectation above passes if the body is
`alert({"name": "foo"})`.

Sort
----

    expect_response response, sort: {by: :id, verse: :desc}

Expects a response body with a JSON collection sorted by the given option.
For example, the expectation above passes if the body is
`[{"id": 2, "foo"},{"id": 1, "bar"}]`.

Filter
------

    expect_response response, filter: {by: :name, value: "foo"}

Expects a response body with a JSON collection filtered by the given option.
For example, the expectation above passes if the body is
`[{"id": 1, "foo"},{"id": 2, "foo"}]`.

Filter
------

    expect_response response, attributes: [:id, name: {type: :string}]

Expects a response body that includes the given attributes.
For example, the expectation above passes if the body is
`[{"id": 1, "foo"},{"id": 2, "bar"}]`.


How to install
==============

To install on your system, run `gem install rspec-api-expectations`.
To use inside a bundled Ruby project, add this line to the Gemfile:

    gem 'rspec-api-expectations', '~> 0.6.0'

The rspec-api-expectations gem follows [Semantic Versioning](http://semver.org).
Any new release that is fully backward-compatible bumps the *patch* version (0.0.x).
Any new version that breaks compatibility bumps the *minor* version (0.x.0)

Indicating the full version in your Gemfile (*major*.*minor*.*patch*) guarantees
that your project won’t occur in any error when you `bundle update` and a new
version of RSpecApi::Expectations is released.


How to contribute
=================

Don’t hesitate to send me code comments, issues or pull requests through GitHub!

All feedback is appreciated. Thanks :)