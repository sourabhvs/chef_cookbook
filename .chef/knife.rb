# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sourabhvs"
client_key               "#{current_dir}/sourabhvs.pem"
validation_client_name   "qwinix1-validator"
validation_key           "#{current_dir}/qwinix1-validator.pem"
chef_server_url          "https://api.chef.io/organizations/qwinix1"
cookbook_path            ["#{current_dir}/../cookbooks"]
