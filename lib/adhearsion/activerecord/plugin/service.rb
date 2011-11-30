module Adhearsion
  module ActiveRecord
    class Plugin
      class Service
        class << self

          ##
          # Start the ActiveRecord connection with the configured database
          def start
            raise "Must supply an adapter argument to the ActiveRecord configuration" if (config.adapter.nil? || config.adapter.empty?)

            require_dependencies
            require_models

            params = config.__values.select { |k,v| !v.nil? }

            # You may need to uncomment the following line for older versions of ActiveRecord
            # ActiveRecord::Base.allow_concurrency = true
            establish_connection params.tap { |p| p.delete :model_paths }

            ::ActiveRecord::Base.logger = logger

            create_call_hook_for_connection_cleanup
          end

          ##
          # Stop the database connection
          def stop
            ::ActiveRecord::Base.remove_connection
          end

          private

          def create_call_hook_for_connection_cleanup
            Adhearsion::Events.register_callback([:before_call]) do
              ::ActiveRecord::Base.verify_active_connections!
            end
          end


          def require_dependencies
            begin
              require 'active_record'
            rescue LoadError
              logger.fatal "Database support requires the \"activerecord\" gem."
              # Silence the abort so we don't get an ugly backtrace
              abort ""
            end
          end

          def require_models
            Array(config.model_paths).each { |model| load model }
          end

          ##
          # Start the ActiveRecord connection with the configured database
          #
          # @param params [Hash] Options to establish the database connection
          def establish_connection params
            p params
            ::ActiveRecord::Base.establish_connection params
          end

          ##
          # Access to activerecord plugin configuration
          def config
            @config ||= Adhearsion.config[:adhearsion_activerecord]
          end

        end # class << self
      end # Service
    end # Plugin
  end # ActiveRecord
end # Adhearsion
