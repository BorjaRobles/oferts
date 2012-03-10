module Ofert::WorksHelper
  def randimage
    array = ["cabezapos.gif","cabezapos1.gif","cabezapos2.gif","cabezapos3.gif"]
    array[rand(array.size)]
  end
end
