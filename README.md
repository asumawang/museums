## Overview
Glue and Athena resources for extracting data from https://www.kaggle.com/imls/museum-directory

## Files

 - **athena_results.csv** - The CSV export of the Athena results
 - **athena.sql** - Athena query to get the number of museums by type for each city and each state
 - **cfn_template.json** - CloudFormation template for creating the service role used by AWS Glue
 - **glue_job.py** - The AWS Glue Job script
 - **job-config-1.png** - Screenshot of AWS Glue Job Configuration
 - **job-config-2.png** - Screenshot of AWS Glue Job Configuration
