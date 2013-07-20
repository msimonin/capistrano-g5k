capistrano-g5k
==============

usage : 

    > cap -T
    --------------
    cap cassandra                   # Deploy Cassandra on nodes
    cap cassandra:apply             # Apply recipe
    cap cassandra:generate          # Generate Cassandra config file
    cap cassandra:modules:install   # Install Cassandra module
    cap cassandra:modules:uninstall # Uninstall Cassandra module
    cap cassandra:puppet            # Puppet install
    cap cassandra:transfer          # Transfer the puppet recipe
    cap clean                       # Remove all running jobs
    cap deploy                      # Deploy with Kadeploy
    cap invoke                      # Invoke a single command on the remote servers.
    cap shell                       # Begin an interactive Capistrano session.
    cap submit                      # Submit jobs 
