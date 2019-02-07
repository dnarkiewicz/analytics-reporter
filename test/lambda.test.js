const lambda = require("../lambda.js");

process.env.ENVIRONMENT = 'test';
process.env.AWS_REGION  = 'us-east-1';

lambda.generateAnalyticsReporterData({
    'ANALYTICS_REPORTS': [
        // {"id":"ga:147714046","path":"analytics/data"},
        {"id":"ga:147749852","path":"analytics/data/gobierno"},
        {"id":"ga:147777730","path":"analytics/data/usagov"}
    ]
});