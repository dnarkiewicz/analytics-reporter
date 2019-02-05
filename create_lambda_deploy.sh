# maybe a zip file was passed in?
if [ -z "$1" ]; then 
    OUTFILE='./lambda-deploy.zip';
else
    OUTFILE="$1";
fi

# clear out existing node modules to get ready for lambda
rm -rf ./node_modules

# lambda already include a more recent version of aws-sdk 
# so we just get rid of it as a dependency 
# now the node_module directory is smaller for deploy
# this breaks local builds, however, so we put it back when done
sed -i.bkp '/"aws-sdk"/d' ./package.json
#npm install aws-sdk@2.395.0
rm -f ./package-lock.json
npm install --production
#npm install --no-optional --production

if [ -f "$OUTFILE" ]; then
    rm $OUTFILE;
fi

# we only need these directories to function
zip -r $OUTFILE \
    ./bin \
    ./node_modules \
    ./src \
    ./reports \
    index.js \
    lambda.js

# put back original package file 
mv package.json.bkp package.json
npm install

# deploy this out - this is just test code for local dev
#aws lambda update-function-code --function-name analyticsReporterTest --zip-file fileb://$OUTFILE
