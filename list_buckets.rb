# Get access keys from local config
# require File.expand_path(File.dirname(__FILE__) + '/./config')

# Get access keys from command line
require 'rubygems'
require 'yaml'
require 'aws-sdk'

(aki, sak) = ARGV

AWS.config({
  :access_key_id => aki,
  :secret_access_key => sak,
})

# get an instance of the S3 interface using the default configuration
s3 = AWS::S3.new

# list buckets and their objects
s3.buckets.each do |bucket|
  puts bucket.name
	bucket.objects.each do |obj|
		puts obj.key
	end
	puts 'END:END:END\n'
end