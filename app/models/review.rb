class Review < ActiveRecord::Base
  attr_accessible :asunto, :desc, :idAsiento, :idUsuario, :idViaje, :puntaje
end
