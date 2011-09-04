current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sabril"
client_key               "#{current_dir}/sabril.pem"
validation_client_name   "ittelkom-validator"
validation_key           "#{current_dir}/ittelkom-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/ittelkom"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
