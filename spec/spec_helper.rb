require 'adhearsion/activerecord'

RSpec.configure do |config|
  config.before(:each) do
    Adhearsion.config[:adhearsion_activerecord].adapter     = "mysql"
    Adhearsion.config[:adhearsion_activerecord].database    = "test"
    Adhearsion.config[:adhearsion_activerecord].username    = "admin"
    Adhearsion.config[:adhearsion_activerecord].password    = ""
    Adhearsion.config[:adhearsion_activerecord].host        = "localhost"
    Adhearsion.config[:adhearsion_activerecord].port        = 3306
    Adhearsion.config[:adhearsion_activerecord].model_paths = []
  end
end
