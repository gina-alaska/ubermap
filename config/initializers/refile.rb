# config/initializers/refile.rb
require "refile/s3"
# require 'refile/simple_form'

# don't configure aws when precompiling in hab
if Rails.application.secrets.aws_access_key_id
  aws = {
    access_key_id: Rails.application.secrets.aws_access_key_id,
    secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: "us-west-2",
    bucket: Rails.application.secrets.bucket_name,
  }

  Refile.cache = Refile::S3.new(max_size: 10.megabytes, prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
