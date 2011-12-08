log_level                :info
log_location             STDOUT
node_name                'syaifulsabril'
client_key               '/Users/syaifulsabril/chef-repo/.chef/syaifulsabril.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef/validation.pem'
chef_server_url          'http://67.202.38.172:4000'
cache_type               'BasicFile'
cache_options( :path => '/Users/syaifulsabril/chef-repo/.chef/checksums' )

knife[:aws_access_key_id] = "AKIAJOZHFEZALLKCKUOQ"
knife[:aws_secret_access_key] = "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"