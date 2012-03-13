require "open-uri"
class Ofert::BaseController < ApplicationController
  def index
  end
  
  private  
     def check_time
       last_created = Ofert.last
       if last_created
         true if Time.now > Ofert.last.created_at + 1.day
       else
         true
       end
     end

     def get_url(web)
       Nokogiri::HTML(open(web))
     end

     def get_array(ref,data)
       ref.css(data)
     end

     def get_title(objeto,ref,data,slice=false,max=110)
       ref.css(data).each do |titulo|      
         if slice == false
           duplicado = Ofert.where(:title =>titulo.content )
           duplicado.destroy_all        
           objeto.title = titulo.content
         elsif slice == true
           duplicado = Ofert.where(:title =>titulo.content.slice(0,max))
           duplicado.destroy_all
           objeto.title = titulo.content.slice(0,max)
         end
       end
     end    

     def get_price(objeto,ref,data)
       ref.css(data).each do |price|
         precio = price.content.gsub(",",".").gsub(" ","").gsub("\u20AC","").to_f
         objeto.price =precio.to_f
       end
     end

     def get_link(objeto,ref,data)
       ref.css(data).each do |link|
          objeto.link=link.attributes["href"].value
       end
     end

     def get_description(objeto,ref,data)
       ref.css(data).each do |description| 
         objeto.description = description.content 
       end
     end

     def get_image(objeto,ref,data)
       ref.css(data).each do |imagen|
         objeto.image = imagen.attributes["src"].value
       end
     end
end

