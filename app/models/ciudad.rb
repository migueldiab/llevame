class Ciudad < ActiveRecord::Base
  attr_accessible :coordX, :coordY, :idDepartamento, :nombre, :poblacion, :popular, :usuarios
end
