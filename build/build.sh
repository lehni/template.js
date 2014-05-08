# Template.js JavaScript Template Engine
# (c) 2005 - 2011 Juerg Lehni, http://lehni.org/
#
# Bootstrap is released under the MIT license
# http://bootstrapjs.org/
#
# build.sh
#
# The build script that produces all the different versions of the
# Template.js library:
#
# Template-browser.js	For new generation browsers.
# Template-rhino.js		For Rhino based JS engines in Java
# Template-helma.js		For Helma, the JS Web Application Server
#
# Usage:
# build.sh MODE
#
# MODE:
#	commented		Preprocessed but still formated and commented (default)
#	stripped		Formated but without comments
#	compressed		Uses UglifyJS to reduce file size

if [ $# -eq 0 ]
then
	MODE="commented"
else
	MODE=$1
fi

# Create the out folder if it does not exist yet.
if [ ! -d ../out/ ]
then
	mkdir ../out/
fi

./preprocess.sh $MODE ../src/Template.js ../out/Template-helma.js '{ "helma": true, "rhino": true }'
./preprocess.sh $MODE ../src/Template.js ../out/Template-rhino.js '{ "rhino": true }'
./preprocess.sh $MODE ../src/Template.js ../out/Template-browser.js '{ "browser": true }'