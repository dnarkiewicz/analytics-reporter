# clear out existing node modules to get ready for lambda
rm -rf ./node_modules
# lambda already include a more recent version of aws-sdk 
# so we just get rid of it as a dependency 
# now the node_module directory is smaller for deploy
# this breaks local builds, however, so we put it back when done
sed -i.bkp '/"aws-sdk"/d' ./package.json
rm -f ./package-lock.json
npm install --no-optional --production
# move in the lambda entry-point
rm ./usagov-analytics-lambda-deploy.zip
# we only need these directories to function
zip -r ./usagov-analytics-lambda-deploy.zip \
    ./bin \
    ./node_modules \
    ./src \
    ./reports \
    index.js \
    lambda.js
# put back original package file 
mv package.json.bkp package.json
