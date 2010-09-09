require 'aws/s3'
require 'yaml'
s3=YAML::load_file("#{Rails.root}/config/s3.yml") 
AWS::S3::Base.establish_connection!(
    :access_key_id     => s3['access_key_id'],
    :secret_access_key => s3['secret_access_key']
)
