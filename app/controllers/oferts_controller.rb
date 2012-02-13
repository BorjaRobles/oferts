require "open-uri"
class OfertsController < ApplicationController
  before_filter :find_oferts_groupalia, :only => [:index]
  def index
    @oferta = Ofert.all    
  end 
  

  def show
  end

  def find
  end
  
  private
    def find_oferts_groupalia
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
         div.css('a.sprite_icons').each do |link|
            @oferta.link  = link.attributes["href"].value
          end
          
        div.css('div.subtitle_multi').each do |description| 
          @oferta.description  = description.content 
        end
        div.css('img.image').each do |imagen|
          @oferta.image  = imagen.attributes["src"].value
        end
              
        @oferta.save             
      end     
   
      doc = Nokogiri::HTML(open('http://www.groupon.es/deals/barcelona'))      
      @oferta =  Ofert.new
      titulo = doc.css('h1 a').text
      titulo = titulo.slice(0,110) + "..."
      descripcion = doc.css('h1 a').text
      
      duplicado = Ofert.where(:title => titulo )
      duplicado.destroy_all
      doc.css('button img').each do |imagen|
        @oferta.image = imagen.attributes["src"].value
      end
      @oferta.title = titulo
      imagen = doc.css('span.price span.noWrap').text
      @oferta.price = imagen.gsub(",",".").gsub(" ","").gsub("\u20AC","").to_f
      @oferta.link  = "http://www.groupon.es/deals/barcelona"
      @oferta.description = descripcion
      @oferta.save
      
      doc.css("div.extraDealMulti").each do |div|
        @oferta =  Ofert.new
        titulo = div.css("a").text
        titulo = titulo.slice(0,110) + "..."        
        duplicado = Ofert.where(:title =>titulo)
        duplicado.destroy_all
        @oferta.title = titulo        
        div.css("div.extraDealImage img").each do |imagen|
          @oferta.image = imagen.attributes["src"].value
        end        
        descripcion = div.css("a").text
        @oferta.description = descripcion        
        div.css("div.extraDealView a").each do |link|
          @oferta.link = link.attributes["href"].value
        end
        @oferta.save        
      end
      
      a = Mechanize.new
      oferta = a.get("http://www.groupon.es/missed-deals/barcelona").search(".//div[@class='recentDeal']")
      oferta.each do |ofert|
        @oferta = Ofert.new
          encontrar_link(@oferta,ofert,"div.recentDealImage a")
          #prueba_descripcion(@oferta,@oferta.link,ofert)
                
          try1 = Mechanize.new
          oferta = try1.get(@oferta.link).search(".//div[@class='boxSoldoutDeal']")
          @oferta.description = oferta.css("span.teaser").text        
          encontrar_titulo(@oferta,ofert,"div.recentDealDescription",true,103)
          #encontrar_descripcion(@oferta,ofert,"div.recentDealDescription") contentBoxNormalLeft
          encontrar_imagen(@oferta,ofert,"div.recentDealImage img.right")          
          encontrar_precio(@oferta,ofert,"span.priceValue")
        @oferta.save
      end
      
      doc = Nokogiri::HTML(open('http://es.letsbonus.com/barcelona'))    
      contador = 1
        while contador < 19 do
            @oferta = Ofert.new
            div = doc.css("div#offer#{contador}")
            
            div.css('h3.frontTitle a').each do |titulo|
              duplicado = Ofert.where(:title =>titulo.content )
              duplicado.destroy_all
              @oferta.title = titulo.content
            end        
            div.css('span.value').each do |price|
              precio = price.content.gsub(",",".")
              @oferta.price = precio.to_f
            end
             div.css('h3.frontTitle a').each do |link|
                @oferta.link  = link.attributes["href"].value
              end

            div.css('div.text').each do |description| 
              @oferta.description  = description.content 
            end
            div.css('div.product img').each do |imagen|
              @oferta.image  = imagen.attributes["src"].value
            end
            @oferta.save
            contador += 1
          end
     
        
        
        
     
    end
    
end
