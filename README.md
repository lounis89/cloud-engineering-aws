# AWS Serverless architecture with Terraform  
This project showcases the initial stage of a data architecture on AWS. The objective is to establish a pipeline utilizing the pub/sub pattern, starting with the uploading of a file into a primary storage location (S3 bucket) consisting of raw files. This upload will generate an event that will be published to an SNS topic, and the administrator will be notified via email simultaneously. A message will be sent to an SQS queue in order to begin processing the file. This queue will trigger a lambda function that will execute the processing and store it in a secondary storage location containing the processed files.  

![architecture diagram](https://i.imgur.com/sRt1bny.png)
