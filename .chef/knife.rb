current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'imac' # client name (must be same with client name in chef server)
client_key               'imac.pem'
validation_client_name   'chef-validator' # validator (must be same with chef-validator in chef server)
validation_key           'validation.pem'
chef_server_url          'http://localhost:4000'
cache_type               'BasicFile'
cache_options( :path => '/Users/syaifulsabril/chef-repo-backup/.chef/checksums' )

cookbook_path	["/Users/syaifulsabril/chef-repo-backup/cookbooks"]

knife[:aws_access_key_id] = "AKIAJOZHFEZALLKCKUOQ"
knife[:aws_secret_access_key] = "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"