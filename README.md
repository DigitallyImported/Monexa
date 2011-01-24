monexa
======

A ruby gem that interfaces with the Monexa XML API

Monexa is a SaaS for subscription-based billing, see [http://www.monexa.com] for more details

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

- All api methods are dynamic via method_missing and accessible via the Monexa::Api class. The method name should be in pascal notation and will be automatically formatted.
- Parameters are sent as a hash, and converted to monexa format automatically.
