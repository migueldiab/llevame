class Pais < ActiveRecord::Base
  table_name= "paises"

  attr_accessible :bandera, :idioma, :nombre

  has_many :fabricantes, :class_name => "Fabricante"

  belongs_to :idioma, :class_name => "Idioma", :foreign_key => "idIdioma"
end
