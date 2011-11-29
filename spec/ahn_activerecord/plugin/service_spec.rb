require 'spec_helper'

describe AhnActiveRecord::Plugin::Service do

  describe "when starting the ActiveRecord connection" do    

    def tempfile_with_contents(contents)
      Tempfile.new("bogus_model").tap do |file|
        file.puts contents
        file.flush
      end
    end

    def sample_user_model
      <<-CODE
        class User < ActiveRecord::Base
          validates_uniqueness_of :name
        end
      CODE
    end

    after do
      reset_ahn_activerecord_config
    end
    
    let :options do
      {
        :adapter  => "mysql",
        :database => "test",
        :username => "admin",
        :password => "",
        :host     => "localhost",
        :port     => 3306
      }
    end

    it "should raise an exception when no adapter has been configured" do
      Adhearsion.config[:ahn_activerecord].adapter = nil
      lambda {Adhearsion::Plugin.load}.should raise_error "Must supply an adapter argument to the ActiveRecord configuration"
    end

    it "establishes the connection with the not nil config values as options" do
      Adhearsion.config.ahn_activerecord.database = "test"
      AhnActiveRecord::Plugin::Service.should_receive(:require_models).once.and_return true
      AhnActiveRecord::Plugin::Service.should_receive(:establish_connection).with(options).and_return true
      AhnActiveRecord::Plugin::Service.start
    end

    it "establishes the connection with the updated configuration" do
      Adhearsion.config.ahn_activerecord do |config|
        config.adapter  = "sqlite3"
        config.database = "foo.sqlite3"
        config.username = nil
        config.password = nil
        config.host     = nil
        config.port     = nil
      end
      AhnActiveRecord::Plugin::Service.should_receive(:require_models).once.and_return true
      AhnActiveRecord::Plugin::Service.should_receive(:establish_connection).with({:adapter => "sqlite3", :database => "foo.sqlite3"}).and_return true
      AhnActiveRecord::Plugin::Service.start
    end

    it "should make any required models available in the main namespace" do
      bogus_model = tempfile_with_contents sample_user_model
      Adhearsion.config.should_receive(:files_from_setting).once.with("paths", "models").and_return [bogus_model.path]
      AhnActiveRecord::Plugin::Service.should_receive(:establish_connection).with(options).and_return true
      AhnActiveRecord::Plugin::Service.start
      User.superclass.should be ActiveRecord::Base
    end

  end

end
