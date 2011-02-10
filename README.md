monexa
======

A ruby gem that interfaces with the Monexa XML API

Monexa is a SaaS for subscription-based billing, see [Monexa](http://www.monexa.com/) for more details

Changelog
---------

**v0.2**

- Added support for command templates using yaml format, hashes are automatically re-ordered based on template layout.
- Implemented api requests using standard `net/https` lib, removed curb depedency.
- Fixed Gemspec

**v0.1** 

- Initial release, basic API access

Setup
-----

Create a configuration file named 'monexa.yml' and place it in your config/ folder.
The configuration file is automatically loaded for you and values are accessible via Monexa::config struct.

Example configuration:

	:url: "https://api.monexa.com/v05_22/XML/monexa_xml.cgi"
	:username: "API_USERNAME"
	:password: "API_PASSWORD"
	:provider_id: "YOUR_PROVIDER_ID"
	:office_id: "YOUR_OFFICE_ID"

Usage
----

	require 'monexa'
	response = Monexa::Api.ping
	puts response.success?
	puts response.data[:version]
