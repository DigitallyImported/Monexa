monexa
======

Ruby gem for interfacing with the Monexa XML API

Monexa is a SaaS for subscription-based billing, see [Monexa](http://www.monexa.com/) for more details

Changelog
---------

**v0.3.0**

- Added dry-run support, builds command but won't send to api
- moved api modules into separate files autloaded via main api module
- adding Subscriber helper methods
- updated tests

**v0.2.0**

- Added support for command templates using yaml format, hashes are automatically re-ordered based on template layout.
- Implemented api requests using standard `net/https` lib, removed curb depedency.
- Fixed Gemspec

Setup
-----

Create a configuration file 'monexa.yml' and place it in your apps root folder, (or config/ if using Rails). The configuration file is automatically loaded for you and values are accessible via Monexa::config struct.

Example configuration:

	:url: "https://api.monexa.com/v05_24/XML/monexa_xml.cgi"
	:username: "API_USERNAME"
	:password: "API_PASSWORD"
	:provider_id: "YOUR_PROVIDER_ID"
	:office_id: "YOUR_OFFICE_ID"

Dependencies
----

- libxml-ruby for processing xml responses

Usage
----

	require 'monexa'
	response = Monexa::ping
	puts response.success?
	puts response.data[:version]