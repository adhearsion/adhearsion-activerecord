require 'spec_helper'

describe AhnActiveRecord::Plugin do

  describe "while accessing the plugin configuration" do

    it "should retrieve a valid configuration instance" do
      Adhearsion.config.ahn_activerecord.should be_instance_of Loquacious::Configuration
    end

    it "should configure properly the adapter" do
      Adhearsion.config[:ahn_activerecord].adapter.should == :mysql
    end

    it "should configure properly the username" do
      Adhearsion.config[:ahn_activerecord].username.should == "admin"
    end

    it "should configure properly the password" do
      Adhearsion.config[:ahn_activerecord].password.should be_empty
    end

    it "should configure properly the host" do
      Adhearsion.config[:ahn_activerecord].host.should == "localhost"
    end

    it "should configure properly the port" do
      Adhearsion.config[:ahn_activerecord].port.should == 3306
    end

  end

  describe "while configuring a specific config value" do
    after do
      reset_ahn_activerecord_config
    end

    it "ovewrites properly the adapter value" do
      Adhearsion.config[:ahn_activerecord].adapter = "sqlite3"
      Adhearsion.config[:ahn_activerecord].adapter.should == "sqlite3"
    end
    
    it "ovewrites properly the username value" do
      Adhearsion.config[:ahn_activerecord].username = "jon"
      Adhearsion.config[:ahn_activerecord].username.should == "jon"
    end
    
    it "ovewrites properly the password value" do
      Adhearsion.config[:ahn_activerecord].password = "valid-credentials"
      Adhearsion.config[:ahn_activerecord].password.should == "valid-credentials"
    end
    
    it "ovewrites properly the host value" do
      Adhearsion.config[:ahn_activerecord].host = "example"
      Adhearsion.config[:ahn_activerecord].host.should == "example"
    end

    it "ovewrites properly the port value" do
      Adhearsion.config[:ahn_activerecord].port = 3307
      Adhearsion.config[:ahn_activerecord].port.should == 3307
    end

  end

  describe "while loading plugins" do
    it "should load the init block and start the service" do
      AhnActiveRecord::Plugin::Service.should_receive(:start).once.and_return true
      Adhearsion::Plugin.load
    end
  end
end