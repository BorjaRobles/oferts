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
      doc = get_url('http://es.groupalia.com/descuentos-barcelona/')
      get_array(doc,'div.home_deal').each do |ofert|       
        @ofert = Ofert.new
        get_title(@ofert,ofert,'a.title_multi')
        get_price(@ofert,ofert,'div.final_price_multi')
        get_link(@ofert,ofert,'a.sprite_icons')
        get_description(@ofert,ofert,'div.subtitle_multi')
        get_image(@ofert,ofert,'img.image')
        @ofert.save
      end
      
      doc = get_url('http://www.groupon.es/deals/barcelona')
      @oferta =  Ofert.new
      get_title(@oferta,doc,'h1 a',true)
      get_description(@oferta,doc,'h1 a')
      get_image(@oferta,doc,'button img')
      get_price(@oferta,doc,'span.price span.noWrap')
      @oferta.link  = "http://www.groupon.es/deals/barcelona"     
      @oferta.save
           
      doc.css("div.extraDealMulti").each do |ofert|  
        @ofert =  Ofert.new        
        get_title(@ofert,ofert,"h3",true,125)
        get_price(@ofert,ofert,'div.price')
        get_link(@ofert,ofert,"div.extraDealView a")
        get_description(@ofert,ofert,"h3")
        get_image(@ofert,ofert,"div.extraDealImage img")
        @ofert.save        
      end      
      
      doc = get_url("http://www.groupon.es/missed-deals/barcelona")
      doc.css("div.recentDeal").each do |ofert|              
        @ofert = Ofert.new
        get_link(@ofert,ofert,"div.recentDealImage a")
        get_price(@ofert,ofert,"span.priceValue")
        oferta = get_url(@ofert.link)         
        oferta.css("div.boxSoldoutDeal").each do |ofert|
          get_description(@ofert,ofert,'span.teaser')
          get_title(@ofert,ofert,"span.teaser b",true)
          get_image(@ofert,ofert,"span.image img")          
        end
        @ofert.save
      end      
      
      doc = get_url('http://es.letsbonus.com/barcelona')
      contador = 1
      while contador < 19 do
        @ofert = Ofert.new
        ofert = doc.css("div#offer#{contador}")
        get_title(@ofert,ofert,'h3.frontTitle a')
        get_price(@ofert,ofert,'span.value')
        get_link(@ofert,ofert,'h3.frontTitle a')
        get_description(@ofert,ofert,'div.text')
        get_image(@ofert,ofert,'div.product img')
        @ofert.save
        contador += 1
      end     
    end    
end    
