## The AWS Developer Challenge for Data Engineers
### Instructions

In general feel free to expand/change the challenge in any way you like, just explain your solution and decision making, any concerns around it or limitations etc.

Some information/content is left out intentionally to validate your working experience, please fill in the missing parts.

> Fork this repo with your solution. Ideally, we'd like to see your progression through commits, and don't forget to update the README.md to explain your thought process.

**Please do not reference any websites or published articles. We are looking for original content!**

Please let us know how long the challenge took you. We're not looking for how fast or detailed you are. It's just to give us a clearer idea of what you've produced in the time you decided to take. Feel free to go as big or as small as you want.

### AWS Data Engineer | Challenge Information

This company is ingesting data into a 'data lake' running AWS. Below find a picture of the AWS components used for this company's architecture. 

![AWS-COMPONENTS](/media/awscp.png)

#### Section A
Use the components shown above and create an architecture with your tool of choice (powerpoint / draw.io / etc) showing how to ingest data from an on-premise site into AWS. 

Upload the diagram/picture into the Git repository and indicate where it's saved. Use the given components as far as possible to illustrate your solution.

##### Hints
* Focus on *low cost & high* performance.
* All the data are stored in S3 buckets.
* Athena is used to query the data.
* Show how you will use Step Functions to orchestrate the *ingest* process.
* AWS DynamoDB / CloudWatch must be used.
* Glue Jobs should be used to do the ingest.
* CloudFormation output is a CodeBuild Project
* Git is used to save the terraforms and python / pyspark code.
* You do not have to design/depict the CI/CD, assume that it's already in place.
* Look at the available .tf files to get an understanding of the architecture.
___

#### Section B
Within this Readme.md describe the architecture above, giving detail when and how you would use the selected components.
##### Hints
* Consider aspects like security (iam / firewalls / vpc / security groups / roles)
* To each component used, give a detailed description on how it fits into the solution, please do not reference existing AWS documentation, use your own words! Feel free to document your thought process. We are interested to find out how you think.
___

#### Section C
Within the Git Repository Structure:
* Modify the CloudFormation Template [CFN/seed.yaml] in order to create a CodeBuild Project.
* Update the _glue_jobs.tf_, _main.tf_ and _output.tf_ terraform files. 
* Provide the python script that will be used within the glue job, using either python shell or spark, think here about using DynamoDB to keep certain job settings and table structures for S3.
___

### Submit it

Please use a private repo just email us when you are done. 

### My Solution 

*_Section B_*

1.	*AWS CloudFormation*: Step 1: Managing a template model of our data ingestion architecture.

2.	*AWS CodeBuild*: run codebuild to compile our code and run test to check configurations.

3.	*DynamoDB*: after running CodeBuild, under tables and items, you check if configured table has been created.

4.	*AWS Glue Job*: run the glue job after verifying a table has been created in DynamoDB from code build.

5.	*Amazon S3 Raw Bucket*: refresh bucket to see if raw data has been uploaded.

6.	*AWS Step Functions*: run initial step functions with ingest configuration script to upload data into the right table.

7.	*Amazon CloudWatch*: after kicking off step functions, check the logs to see what is happening in the background and monitor if the process is running into errors or not.

8.	*Amazon S3 Source Bucket*: after cloudwatch process, refresh bucket to see if processed data has been uploaded.

9.	*AWS Glue Job*: run glue job to process and write data from source to your target.

10.	*Amazon S3 Target Bucket*: refresh bucket to see data in final form.


### Additional Comments / Information / Concerns
- Data Ingest Diagram saved in media directory.

- I only have 2 config files - spark_ingest and prepare.

- I have renamed my config_name to "gb_github".

- I have renamed my sources to "github_gb_src".

- I have renamed session_name to "gb_github_ch" - ch for challenge.

- My etl job is named "files-spark-ingest-default".

- My table_config is a made up table.

- In prepare config - I have named my table_name and source_table_name to "gb_github_challenge".

- Create main.tf file in configs directory.

- I'm a bit concerned regarding values for keys in configuration files - I left them blank due to lack of AWS value providers.

- seed.yaml, glue_jobs.tf, main.tf and output.tf files left unupdated.

- ### Python Script
(no python script attached - I tried doing this section from a perspective of someone who has not worked with AWS before. I did not want to reference anything from anywhere).