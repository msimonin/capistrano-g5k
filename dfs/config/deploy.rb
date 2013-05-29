set :g5k_user, "msimonin"
set :gateway, "#{g5k_user}@access.grid5000.fr"
# ssh key for the gateway
ssh_options[:keys]= [File.join(ENV["HOME"], ".ssh_cap", "id_rsa_cap")]
# this key will be copied to deployed nodes
set :ssh_public,  File.join(ENV["HOME"], ".ssh_insideg5k", "id_rsa.pub")

set :walltime, ENV['walltime'] || XP5K::Config[:walltime] || "1:00:00"
set :subnet, ENV['subnet'] || "slash_22"
set :vlan, ENV['vlan'] || "14"

