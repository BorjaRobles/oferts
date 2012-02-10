require "open-uri"
class OfertsController < ApplicationController
  before_filter :find_oferts, :only => [:index]
  
  def index
    @oferta = Ofert.all
  end 
  

  def show
  end

  def find
  end
  
  private
    def find_oferts
      #Find offerts in barcelona 
      doc = Nokogiri::HTML(open('http://es.groupalia.com/descuentos-barcelona/'))
      
      doc.css('div.home_deal').each do |div|
        #por cada oferta encontrada se crea un objeto y se guarda en la BD
        #comprueba que las ofertas no se repiten !!!
        @oferta = Ofert.new
        div.css('a.title_multi').each do |titulo|
          duplicado = Ofert.where(:title =>titulo.content )
          duplicado.destroy_all
          @oferta.title = titulo.content
        end
        
        div.css('div.final_price_multi').each do |price|
          precio = price.content.gsub(",",".")
          @oferta.price = precio.to_f
        end

        div.css('div.subtitle_multi').each do |description|
          @oferta.description  = description.content 
        end

        div.css('img.image').each do |imagen|
          @oferta.image  = imagen.attributes["src"].value
        end

        div.css('a.sprite_icons').each do |link|
          @oferta.link  = link.attributes["href"].value
        end             
        
        @oferta.save             
      end
    end
end
