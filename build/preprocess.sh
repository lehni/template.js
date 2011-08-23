#!/bin/sh

# Bootstrap JavaScript Library
# (c) 2006 - 2010 Juerg Lehni, http://lehni.org/
#
# Bootstrap is released under the MIT license
# http://bootstrapjs.org/
#
# Usage:
# preprocess.sh MODE SOURCE DESTINATION ARGUMENTS
#
# ARGUMENTS:
#	e.g. "-DBROWSER"
#
# MODE:
#	commented		Preprocessed but still formatted and commented
#	stripped		Formated but without comments
#	compressed		Uses UglifyJS to reduce file size

COMMAND="./prepro.js -d '$4' $2"

case $1 in
	stripped)
		eval "$COMMAND -c" > $3
		;;
	commented)
		eval $COMMAND > $3
		;;
	compressed)
		eval $COMMAND > temp.js
		../../uglifyjs/bin/uglifyjs temp.js --extra --unsafe --reserved-names "$eval,$sign" > $3
		rm temp.js
		;;
esac
