module Adhearsion
  module ActiveRecord
    class Plugin
      class Service
        class << self

          ##
          # Start the ActiveRecord connection with the configured database
          def start
            raise "Must supply an adapter argument to the ActiveRecord configuration" if (config.adapter.nil? || config.adapter.empty?)

            params = config.to_hash.select { |k,v| !v.nil? }

            require_models(*params.delete(:model_paths))
            establish_connection params

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
            Adhearsion::Events.punchblock Punchblock::Event::Offer  do
              ::ActiveRecord::Base.verify_active_connections!
            end
          end

          def require_models(*paths)
            paths.each { |model| require model }
          end

          ##
          # Start the ActiveRecord connection with the configured database
          #
          # @param params [Hash] Options to establish the database connection
          def establish_connection(params)
            ::ActiveRecord::Base.establish_connection params
          end

          ##
          # Access to activerecord plugin configuration
          def config
            @config ||= Plugin.config
          end

        end # class << self
      end # Service
    end # Plugin
  end # ActiveRecord
end # Adhearsion
