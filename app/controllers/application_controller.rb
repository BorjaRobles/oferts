class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def encontrar_link(objeto,data,instruccion)
      data.css("#{instruccion}").each do |link|
        objeto.link = link.attributes["href"].value
      end
    end
    
    def encontrar_precio(objeto,data,instruccion)      
      data.css("#{instruccion}").each do |price|
        objeto.price = price.text.gsub(",",".").gsub(" ","").gsub("\u20AC","").to_f
      end
    end
    
    def encontrar_imagen(objeto,data,instruccion)      
      data.css("#{instruccion}").each do |image|
        objeto.image = image.attributes["src"].value
      end
    end
    
    def encontrar_descripcion(objeto,data,instruccion)      
      objeto.description = data.css("#{instruccion}").text
    end
    
    def prueba_descripcion(objeto,link,data)
    end
    
    def encontrar_titulo(objeto,data,instruccion,slice=false,max=110)      
      if slice == false
        objeto.title = data.css("#{instruccion}").text
        duplicado = Ofert.where(:title => data.css("#{instruccion}").text)
        duplicado.destroy_all
      elsif slice==true
        objeto.title = data.css("#{instruccion}").text.slice(0,max)
        duplicado = Ofert.where(:title => data.css("#{instruccion}").text.slice(0,max))
        duplicado.destroy_all
      end
    end
  
end
