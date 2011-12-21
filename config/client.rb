current_dir = "/Users/syaifulsabril/chef-repo-backup"
log_level                :info
log_location             STDOUT
node_name                'imac' # client name (must be same with client name in chef server)
client_key               "#{current_dir}/.chef/imac.pem"
validation_client_name   'chef-validator' # validator (must be same with chef-validator in chef server)
validation_key           "#{current_dir}/.chef/validation.pem"
chef_server_url          'http://localhost:4000'
cache_type               'BasicFile'
cache_options( :path => "#{current_dir}/.chef/checksums" )