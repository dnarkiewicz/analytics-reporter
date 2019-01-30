function generateAnalyticsReporterData (event, context, callback) 
{
    buildEnvFromParamterStore(function()
    {
        /// hardcoded default
        var reports = [{"id":"ga:147714046","path":"analytics"},{"id":"ga:147749852","path":"analytics/gobierno"},{"id":"ga:147777730","path":"analytics/usagov"}];
        /// reports overridable by lambda function params
        if ( event.ANALYTICS_REPORTS ) 
        {
            reports = JSON.parse(event.ANALYTICS_REPORTS);
        /// reports overridable by lambda environment params
        } else if ( 'ANALYTICS_REPORTS' in process.env ) {
            reports = JSON.parse(process.env.ANALYTICS_REPORTS);            
        }
        return runReports(reports);
    });
}

function buildEnvFromParamterStore( next )
{

    /// first we must pull out our config parameters directly from ParameterStore
    /// we doesn't rely on lambda function having preconfigured env vars
    /// this is an attempt to make deploys easier, so we can change params without 
    /// having to edit the lambda function directly
    
    /// AWS Parameter store will be using the pattern: /APP_PREFIX + /ENV_PREFIX + /PARAM_NAME 
    // var param_prefix = "/ssg/ar/";
    var param_prefix = "/project_app_usa/";
    /// must begin and end in a slash
    if ( ! param_prefix.match(/\/$/) ) 
    {
        param_prefix += '/';    
    }
    if ( ! param_prefix.match(/^\//) ) 
    {
        param_prefix = '/'+param_prefix;
    }     
    var AWS = require('aws-sdk');
    /// running this locally needs as explicit region declaration
    /// but in lambda the region is already 
    if ( 'AWS_REGION' in process.env )
    {
        AWS.config.update({region:process.env.AWS_REGION});
    } else if ( 'AWS_DEFAULT_REGION' in process.env ) {
        AWS.config.update({region:process.env.AWS_DEFAULT_REGION});
    }
    
    /// prefix the param store keys correctly with environment name
    if ( 'ENVIRONMENT' in process.env )
    {
        param_prefix += process.env.ENVIRONMENT;
        if ( ! param_prefix.match(/\/$/) ) 
        {
            param_prefix += '/';    
        }
    }

    /// get all the paramters with our prefix
    var ssm = new AWS.SSM();
    ssm.getParametersByPath({ 
        Path: param_prefix,
        Recursive: true,
        WithDecryption: true,
    }, function(err, data) {
        
        /// bail on error
        if (err) 
        {
            console.log('Error reading from Paramter Store');
            console.log(err, err.stack);
            return;
        }
        
        /// convert ParamterStore values to Env values since that's what
        /// the analytics-reporter is expecting
        for ( var i=0; i<data.Parameters.length; i++ )
        {
            var envVar = data.Parameters[i].Name.replace(param_prefix,"");
            process.env[envVar] = data.Parameters[i].Value;
        }

        console.log('Data imported from Paramter Store');
        next();
    });

}

function runReports( reports )
{
    /// step through and run each report
    var successes = 0;
    for ( var r=0; r<reports.length; r++ )
    {
        /// each report should get it's own unique values for these params
        process.env.ANALYTICS_REPORT_IDS = reports[r].id;
        process.env.AWS_BUCKET_PATH      = reports[r].path;
        process.env.AWS_CACHE_TIME       = 0;

        console.log('Report '+reports[r].id+' generating');

        /// the execution script requires a clean evnironment every execution
        /// so even though we are already in node, we will drop out to commandline and 
        /// start a separate process to handle each report, I think we will need these 
        /// to be blocking as well, I'm not quite sure why
        const execSync = require('child_process').execSync;
        execSync('./bin/analytics --publish', function (error, stdout, stderr) {
            if ( error )
            {
                console.log('Report '+reports[r].id+' ERROR '+ error);
            } else {
                successes++;
                console.log('Report '+reports[r].id+' SUCCESS: '+stdout);
            }
        });
    }
    return successes;
}

exports.generateAnalyticsReporterData = generateAnalyticsReporterData;
exports.buildEnvFromParamterStore = buildEnvFromParamterStore;
exports.runReports = runReports;
