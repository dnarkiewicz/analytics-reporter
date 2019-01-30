# get the analytics-reporter app from git
if [ ! -d analytics-reporter ]; then
    git clone https://github.com/18F/analytics-reporter.git
fi
cd analytics-reporter
git checkout master
# clear out existing node modules to get ready for lambda
rm -rf ./analytics-reporter/node_modules
# lambda already include a more recent version of aws-sdk 
# so we just get rid of it as a dependency 
# now the node_module directory is smaller for deploy
# this breaks local builds, however, so we put it back when done
sed -i.bkp '/"aws-sdk"/d' ./package.json
rm -f ./package-lock.json
npm install --no-optional --production
# move in the lambda entry-point
cp ../lambda.js ./lambda.js
rm ../lambda-deploy.zip
# we only need these directories to function
zip -r ../usagov-analytics-lambda-deploy.zip \
    ./bin \
    ./node_modules \
    ./src \
    ./reports \
    index.js \
    lambda.js
# put back original package file 
mv package.json.bkp package.json
