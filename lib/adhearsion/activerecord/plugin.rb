module Adhearsion
  module ActiveRecord

    ##
    # Adhearsion Plugin that defines the ActiveRecord configuration options
    # and includes a hook to start the ActiveRecord service in Adhearsion initialization process
    class Plugin < Adhearsion::Plugin
      extend ActiveSupport::Autoload

      autoload :Service, 'adhearsion/activerecord/plugin/service'

      # Configure a database to use ActiveRecord-backed models.
      # See ActiveRecord::Base.establish_connection for the appropriate settings here.
      #
      # MySQL options are preconfigured. If you want o use another adapter, make sure to include the
      # required options in your configuration file
      config :adhearsion_activerecord do
        adapter     "mysql"          , :desc => "Database adapter. It should be an adapter supported by ActiveRecord"
        database    "test"           , :desc => "Database to connect to."
        username    "admin"          , :desc => "valid db username"
        password    ""               , :desc => "valid password"
        host        "localhost"      , :desc => "host where the database is installed"
        port        3306             , :desc => "port where the database is listening"
        model_paths []               , :desc => 'paths to model files to load'
      end

      # Include the ActiveRecord service in plugins initialization process
      init :adhearsion_activerecord do
        Service.start
      end

    end

  end
end
