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

