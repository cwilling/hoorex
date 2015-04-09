Within the context of a local copy of a SlackBuilds.org repository,
HooRex answers the question of who requires a particular package i.e. which
packages name the package of interest in the REQUIRES field of their .info
file? A query like this about, say, package json-c could be answered by
something like:
	find /x/y/slackbuilds -name \*.info |xargs grep REQUIRES |grep json-c

You'll need to wait while all the .info files in the repository are searched;
that's OK for the occasional query but increasingly tiresome for multiple
queries. You'll also need to wade through all the output to pick out the
actual package names - also quite tiresome if you need to accurately supply
package names to some other script or program.

HooRex addresses these issues (and more) by generating and cacheing the
dependency relationships between all packages in the repository, enabling a
rapid response to dependency queries.

The normal (not verbose) output is a plain list of packages which allows it to
be used as the first in a pipeline of applications.

USAGE:
	hoorex -h
provides basic usage information

	hoorex jason-c
outputs the names of packages which directly depend on json-c i.e. those
packages which explicitly name json-c in the REQUIRES field of their .info file.

	hoorex -m json-c
outputs multiple levels of requiring packages e.g. one of the packages which
requires json-c is postgis; postgis is required by pgrouting and pgrouting is
required by osm2pgrouting. The -m flag calculates the multiple levels of all
the requiring packages.

	hoorex json-c speex
outputs direct requirers of both json-c and speex. Any number of packages may
be queried simultaneously.

