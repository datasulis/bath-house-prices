BATH PRICE PAID DATA
--------------------

Scripts to extract [Price Paid data][1] published by the Land Registry

INSTALL
-------

The project has very simple dependencies relying on core libraries plus the Hpricot gem:

	sudo gem install hpricot
	
USAGE
-----

To download and cache all the relevant files run:

	rake download
	
Currently all the scripts do is filter the published files to grab just those properties with 
Bath (BA1, BA2) postcodes.

For documentation on the codes used in the files look at the [Land Registry FAQ][2].

LICENSE
-------

This work is hereby released into the Public Domain. 

To view a copy of the public domain dedication, visit 
http://creativecommons.org/licenses/publicdomain or send a letter to 
Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

[1]: http://www1.landregistry.gov.uk/market-trend-data/public-data
[2]: http://www1.landregistry.gov.uk/market-trend-data/faqs#m18