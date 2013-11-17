v0.6.2  - 2013/11/16
--------------------

* the block passed `expect_response` can use RSpecApi::Matchers, e.g. expect(response).to have_attributes

v0.6.1  - 2013/11/16
--------------------

* `expect_response` accepts a block where custom expectations can be run on the response and request params

v0.6.0  - 2013/11/09
--------------------

* `expect_response` replaces `expect_resourceful`
* Code reorganized by status/headers/body
* All expectations documented and spec'd

v0.5.0  - 2013/11/07
--------------------

* Extracted expectations from rspec-api