## Capistrano sample

    require 'bundler/setup'
    require "rubygems"
    require "xp5k"

    # connection to the gateway parameters
    set :g5k_user, "msimonin"
    set :gateway, "#{g5k_user}@access.grid5000.fr"
    ssh_options[:keys]= [File.join(ENV["HOME"], ".ssh_grid5000", "id_rsa")]
    set :ssh_public,  File.join(ENV["HOME"], ".ssh", "id_rsa_insideg5k.pub")
    
    
    @myxp = XP5K::XPM.new()
    
    @myxp.define_job({
      :resources  => ["nodes=1,walltime=1", "nodes=2,walltime=1"],
      :sites      => %w( nancy lyon) ,
      :types      => ["deploy"],
      :name       => "job1",
      :command    => "sleep 3600"
    })
    
    @myxp.define_job({
      :resources  => ["nodes=1,walltime=1"],
      :sites      => %w(nancy sophia),
      :types      => ["deploy"],
      :name       => "job2",
      :command    => "sleep 3600"
    })

    
    @myxp.define_deployment({
      :environment    => "squeeze-x64-nfs",
      :jobs           => %w{ job1 job2 },
      :key            => File.read("#{ssh_public}")
    })
    
    role :job1 do
      @myxp.get_deployed_nodes("job1", kavlan="-1")
    end
    
    role :job2 do
      @myxp.get_deployed_nodes("job2", kavlan="-1")
    end
    
    desc 'Submit jobs'
    task :submit do
      @myxp.submit
    end
    
    desc 'Deploy with Kadeplopy'
    task :deploy do
      @myxp.deploy
    end
    
    desc 'Status'
    task :status do
      @myxp.status
    end
    
    desc 'Remove all running jobs'
    task :clean do
      logger.debug "Clean all Grid'5000 running jobs..."
      @myxp.clean
    end
    
    desc 'Run date command'
    task :date, :roles => [:job1, :job2] do
      set :user, 'root'
      run 'date'
    end
