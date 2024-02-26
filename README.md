# govdns-checker
A mechanism to check the expiration of SLTT domains

## Source data

The source for these domains comes from the US Census. Specifically [here](https://www.census.gov/data/datasets/2022/econ/gus/public-use-files.html).

## Known issues and TODOs

* The source data from the US Census is a little dirty. Some websites are malformed, so they won't process correctly. For example, anything that's missign a URI handler (the http:// part) is not going to be processed by `uri`. Sometimes, there are typos in the domain name. It's a record set of about 16 thousand, so every possible error will be encountered in here.
