require 'ahn_activerecord'

def reset_ahn_activerecord_config
  Adhearsion.config[:ahn_activerecord].adapter  = "mysql"
  Adhearsion.config[:ahn_activerecord].database = "test"
  Adhearsion.config[:ahn_activerecord].username = "admin"
  Adhearsion.config[:ahn_activerecord].password = ""
  Adhearsion.config[:ahn_activerecord].host     = "localhost"
  Adhearsion.config[:ahn_activerecord].port     = 3306
end