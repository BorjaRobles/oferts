class Ofert::WorksController < ApplicationController
  
  def index
    Job.all.each do |job|
      job.destroy
    end
    if params[:province]
      get_works(params[:province].to_i)
    end    
    @jobs = Job.all
    @jobs = @jobs.paginate(:page => params[:page], :per_page => 16)
  end

  private    
    def get_works(code)
      case code
        when 0
          tecnoempleo_url(params[:words],0)
          trabajos_url(params[:words],'')
          laboris_url(params[:words],0)
          estrabajar_url(params[:words],'')
          monster_url(params[:words],'')
        when 1
          tecnoempleo_url(params[:words],231)
          trabajos_url(params[:words],1060)
          laboris_url(params[:words],15)
          estrabajar_url(params[:words],'coruna')
          monster_url(params[:words],'coruna')
        when 2
          tecnoempleo_url(params[:words],232)
          trabajos_url(params[:words],1065)
          laboris_url(params[:words],1)
          estrabajar_url(params[:words],"alava")
          monster_url(params[:words],"alava")
        when 3
          tecnoempleo_url(params[:words],233)
          trabajos_url(params[:words],1070)
          laboris_url(params[:words],2)          
          estrabajar_url(params[:words],"albacete")
          monster_url(params[:words],"albacete")
        when 4
          tecnoempleo_url(params[:words],234)
          trabajos_url(params[:words],1075)
          laboris_url(params[:words],3)
          estrabajar_url(params[:words],"alicante")
          monster_url(params[:words],"alicante")
        when 5
          tecnoempleo_url(params[:words],235)
          trabajos_url(params[:words],1080)
          laboris_url(params[:words],4)
          estrabajar_url(params[:words],"almeria")
          monster_url(params[:words],"almeria")
        when 6
          tecnoempleo_url(params[:words],236)
          trabajos_url(params[:words],1085)
          laboris_url(params[:words],33)
          estrabajar_url(params[:words],"asturias")
          monster_url(params[:words],"asturias")
        when 7
          tecnoempleo_url(params[:words],237)
          trabajos_url(params[:words],1090)
          laboris_url(params[:words],5)
          estrabajar_url(params[:words],"avila")
          monster_url(params[:words],"avila")
        when 8
          tecnoempleo_url(params[:words],238)
          trabajos_url(params[:words],1095)
          laboris_url(params[:words],6)
          estrabajar_url(params[:words],"Badajoz")
          monster_url(params[:words],"Badajoz")
        when 9
          tecnoempleo_url(params[:words],239)
          trabajos_url(params[:words],1100)
          laboris_url(params[:words],7)
          estrabajar_url(params[:words],"baleares")
          monster_url(params[:words],"baleares")
        when 10
          tecnoempleo_url(params[:words],240)
          trabajos_url(params[:words],1105)
          laboris_url(params[:words],8)
          estrabajar_url(params[:words],"barcelona")
          monster_url(params[:words],"barcelona")
        when 11
          tecnoempleo_url(params[:words],241)
          trabajos_url(params[:words],1110)
          laboris_url(params[:words],48)
          estrabajar_url(params[:words],"bizkaia")
          monster_url(params[:words],"bizkaia")
        when 12
          tecnoempleo_url(params[:words],242)
          trabajos_url(params[:words],1115)
          laboris_url(params[:words],9)
          estrabajar_url(params[:words],"burgos")
          monster_url(params[:words],"burgos")
        when 13
          tecnoempleo_url(params[:words],243)
          trabajos_url(params[:words],1120)
          laboris_url(params[:words],10)
          estrabajar_url(params[:words],"caceres")
          monster_url(params[:words],"caceres")
        when 14
          tecnoempleo_url(params[:words],244)
          trabajos_url(params[:words],1125)
          laboris_url(params[:words],11)
          estrabajar_url(params[:words],"cadiz")
          monster_url(params[:words],"cadiz")
        when 15
          tecnoempleo_url(params[:words],245)
          trabajos_url(params[:words],1130)
          laboris_url(params[:words],39)
          estrabajar_url(params[:words],"cantabria")
          monster_url(params[:words],"cantabria")
        when 16
          tecnoempleo_url(params[:words],246)
          trabajos_url(params[:words],1135)
          laboris_url(params[:words],12)
          estrabajar_url(params[:words],"castellon")
          monster_url(params[:words],"castellon")
        when 17
          tecnoempleo_url(params[:words],247)
          trabajos_url(params[:words],1140)
          laboris_url(params[:words],51)
          estrabajar_url(params[:words],"Ceuta")
          monster_url(params[:words],"Ceuta")
        when 18
          tecnoempleo_url(params[:words],248)
          trabajos_url(params[:words],1145)
          laboris_url(params[:words],13)
          estrabajar_url(params[:words],"ciudadreal")
          monster_url(params[:words],"ciudadreal")
        when 19
          tecnoempleo_url(params[:words],249)
          trabajos_url(params[:words],1150)
          laboris_url(params[:words],14)
          estrabajar_url(params[:words],"cordoba")
          monster_url(params[:words],"cordoba")
        when 20
          tecnoempleo_url(params[:words],250)
          trabajos_url(params[:words],1155)
          laboris_url(params[:words],16)
          estrabajar_url(params[:words],"cuenca")
          monster_url(params[:words],"cuenca")
        when 21
          tecnoempleo_url(params[:words],251)
          trabajos_url(params[:words],1160)
          laboris_url(params[:words],20)
          estrabajar_url(params[:words],"gipuzkoa")
          monster_url(params[:words],"gipuzkoa")
        when 22
          tecnoempleo_url(params[:words],252)
          trabajos_url(params[:words],1165)
          laboris_url(params[:words],17)
          estrabajar_url(params[:words],"girona")
          monster_url(params[:words],"girona")
        when 23
          tecnoempleo_url(params[:words],253)
          trabajos_url(params[:words],1170)
          laboris_url(params[:words],18)
          estrabajar_url(params[:words],"granada")
          monster_url(params[:words],"granada")
        when 24
          tecnoempleo_url(params[:words],254)
          trabajos_url(params[:words],1175)
          laboris_url(params[:words],19)
          estrabajar_url(params[:words],"guadalajara")
          monster_url(params[:words],"guadalajara")
        when 25
          tecnoempleo_url(params[:words],255)
          trabajos_url(params[:words],1180)
          laboris_url(params[:words],21)
          estrabajar_url(params[:words],"huelva")
          monster_url(params[:words],"huelva")
        when 26
          tecnoempleo_url(params[:words],256)
          trabajos_url(params[:words],1185)
          laboris_url(params[:words],22)
          estrabajar_url(params[:words],"huesca")
          monster_url(params[:words],"huesca")
        when 27
          tecnoempleo_url(params[:words],257)
          trabajos_url(params[:words],1190)
          laboris_url(params[:words],23)
          estrabajar_url(params[:words],"jaen")
          monster_url(params[:words],"jaen")
        when 28
          tecnoempleo_url(params[:words],258)
          trabajos_url(params[:words],1195)
          laboris_url(params[:words],26)
          estrabajar_url(params[:words],"larioja")
          monster_url(params[:words],"larioja")
        when 29
          tecnoempleo_url(params[:words],259)
          trabajos_url(params[:words],1200)
          laboris_url(params[:words],35)
          estrabajar_url(params[:words],"laspalmas")
          monster_url(params[:words],"laspalmas")
        when 30
          tecnoempleo_url(params[:words],260)
          trabajos_url(params[:words],1205)
          laboris_url(params[:words],24)
          estrabajar_url(params[:words],"leon")
          monster_url(params[:words],"leon")
        when 31
          tecnoempleo_url(params[:words],262)
          trabajos_url(params[:words],1210)
          laboris_url(params[:words],25)
          estrabajar_url(params[:words],"lleida")
          monster_url(params[:words],"lleida")
        when 32
          tecnoempleo_url(params[:words],261)
          trabajos_url(params[:words],1215)
          laboris_url(params[:words],27)
          estrabajar_url(params[:words],"lugo")
          monster_url(params[:words],"lugo")
        when 33
          tecnoempleo_url(params[:words],263)
          trabajos_url(params[:words],1220)
          laboris_url(params[:words],28)
          estrabajar_url(params[:words],"madrid")
          monster_url(params[:words],"madrid")
        when 34
          tecnoempleo_url(params[:words],264)
          trabajos_url(params[:words],1225)
          laboris_url(params[:words],29)
          estrabajar_url(params[:words],"malaga")
          monster_url(params[:words],"malaga")
        when 35
          tecnoempleo_url(params[:words],265)
          trabajos_url(params[:words],1230)
          laboris_url(params[:words],52)
          estrabajar_url(params[:words],"melilla")
          monster_url(params[:words],"melilla")
        when 36
          tecnoempleo_url(params[:words],266)
          trabajos_url(params[:words],1235)
          laboris_url(params[:words],30)
          estrabajar_url(params[:words],"murcia")
          monster_url(params[:words],"murcia")
        when 37
          tecnoempleo_url(params[:words],267)
          trabajos_url(params[:words],1240)
          laboris_url(params[:words],31)
          estrabajar_url(params[:words],"navarra")
          monster_url(params[:words],"navarra")
        when 38
          tecnoempleo_url(params[:words],268)
          trabajos_url(params[:words],1245)
          laboris_url(params[:words],32)
          estrabajar_url(params[:words],"ourense")
          monster_url(params[:words],"ourense")
        when 39
          tecnoempleo_url(params[:words],269)
          trabajos_url(params[:words],1250)
          laboris_url(params[:words],34)
          estrabajar_url(params[:words],"palencia")
          monster_url(params[:words],"palencia")
        when 40
          tecnoempleo_url(params[:words],270)
          trabajos_url(params[:words],1255)
          laboris_url(params[:words],36)
          estrabajar_url(params[:words],"pontevedra")
          monster_url(params[:words],"pontevedra")
        when 41
          tecnoempleo_url(params[:words],271)
          trabajos_url(params[:words],1260)
          laboris_url(params[:words],37)
          estrabajar_url(params[:words],"salamanca")
          monster_url(params[:words],"salamanca")
        when 42
          tecnoempleo_url(params[:words],273)
          trabajos_url(params[:words],1270)
          laboris_url(params[:words],40)
          estrabajar_url(params[:words],"segovia")
          monster_url(params[:words],"segovia")
        when 43
          tecnoempleo_url(params[:words],274)
          trabajos_url(params[:words],1275)
          laboris_url(params[:words],41)
          estrabajar_url(params[:words],"sevilla")
          monster_url(params[:words],"sevilla")
        when 44
          tecnoempleo_url(params[:words],275)
          trabajos_url(params[:words],1280)
          laboris_url(params[:words],42)
          estrabajar_url(params[:words],"soria")
          monster_url(params[:words],"soria")
        when 45
          tecnoempleo_url(params[:words],272)
          trabajos_url(params[:words],1265)
          laboris_url(params[:words],38)
          estrabajar_url(params[:words],"tenerife")
          monster_url(params[:words],"tenerife")
        when 46
          tecnoempleo_url(params[:words],276)
          trabajos_url(params[:words],1285)
          laboris_url(params[:words],43)
          estrabajar_url(params[:words],"tarragona")
          monster_url(params[:words],"tarragona")
        when 47
          tecnoempleo_url(params[:words],277)
          trabajos_url(params[:words],1290)
          laboris_url(params[:words],44)
          estrabajar_url(params[:words],"teruel")
          monster_url(params[:words],"teruel")
        when 48
          tecnoempleo_url(params[:words],278)
          trabajos_url(params[:words],1295)
          laboris_url(params[:words],45)
          estrabajar_url(params[:words],"toledo")
          monster_url(params[:words],"toledo")
        when 49
          tecnoempleo_url(params[:words],279)
          trabajos_url(params[:words],1300)
          laboris_url(params[:words],46)
          estrabajar_url(params[:words],"valencia")
          monster_url(params[:words],"valencia")
        when 50
          tecnoempleo_url(params[:words],280)
          trabajos_url(params[:words],1305)
          laboris_url(params[:words],47)
          estrabajar_url(params[:words],"valladolid")
          monster_url(params[:words],"valladolid")
        when 51
          tecnoempleo_url(params[:words],281)
          trabajos_url(params[:words],1310)
          laboris_url(params[:words],49)
          estrabajar_url(params[:words],"zamora")
          monster_url(params[:words],"zamora")
        when 52
          tecnoempleo_url(params[:words],282)
          trabajos_url(params[:words],1315)
          laboris_url(params[:words],50)
          estrabajar_url(params[:words],"zaragoza")
          monster_url(params[:words],"zaragoza")
      end
    end
    
    def monster_url(words,province)
      word = words.gsub(" ","-")
      url =  "http://buscartrabajo.monster.es/trabajos/?q=#{word}&where=#{province}&rad=2&sort=rv.di.dt&cy=es"
      a = Mechanize.new
      a.user_agent = "Mac Safari"         
      pagina = a.get(url).search("div.listing")
      pagina.each do |oferta|
        job = Job.new
        job.title = oferta.search("a").text
        job.link = oferta.search('a').first.attributes['href'].value
        job.save
      end
    end    
    
    def estrabajar_url(words,province)
      word = words.gsub(" ","-") + "-#{province}"
      url =  "http://es.trabajar.com/trabajo/#{word}/"
      a = Mechanize.new
      a.user_agent = "Mac Safari"
      pagina = a.get(url).search("div.col1")
      pagina.search("a").each do |oferta|
        job = Job.new
        job.title = oferta.text
        job.link =  "http://es.trabajar.com" + oferta.attributes['href'].value
        job.save
      end
    end
    
    def laboris_url(words,province)
      word= words.gsub(" ","%20")
      url = "http://www.laboris.net/buscadorparrilla.aspx?Palabra=#{word}&Categoria=&Provincia=#{province}&Page=1&Orden=DESC&Campo=FechaRenovacion"
      a = Mechanize.new
      a.user_agent = "Mac Safari"
      pagina = a.get(url).search("div.sepgrid")
      pagina.each do |oferta|
        job = Job.new
        job.title = oferta.search("a.lk1p.lk1bluep.lk1BVisp").first.text
        job.link = "http://www.laboris.net/" + oferta.search("a.lk1p.lk1bluep.lk1BVisp").first.attributes['href'].value
        job.save
      end
    end
    
    def trabajos_url(words,province)
      word = words.gsub(" ","+")
      url = "http://trabajos.com/buscar/?BUSCAR=Buscar&IDPAISBUSQUEDA=100&PALABRACLAVE=#{word}&AREA=&PROVINCIA=#{province}&BOTONBUSCAR=Buscar"  
      a = Mechanize.new
      a.user_agent = "Mac Safari"
      pagina = a.get(url).search("tr")
      pagina.each do |ofert|
        info = ofert.search("td a").first        
        if !info.nil?
          job = Job.new
          job.title = info.text
          job.link = "http://trabajos.com" + info.attributes['href'].value
          job.save
        end       
      end
    end
    
    def tecnoempleo_url(words,province)
      word = words.gsub(" ","+")
      url = "http://www.tecnoempleo.com/busqueda-empleo.php?tp=1&cmdSaveButton=&pagina=0&te=#{word}&cp=29&pr=#{province}&I1=Buscar+ofertas+de+empleo"
      a = Mechanize.new
      a.user_agent = "Mac Safari"
      a.get(url).search("table.table_listado1").each do |oferta|
        job = Job.new
      	job.title = oferta.search("tr td a").first.text
      	job.link = "http://www.tecnoempleo.com" + oferta.search("tr td a").first.attributes['href'].value
      	job.save
      end 
    end
  
    def infojobs_url(words,province)  
      word = words.gsub(" ","-")
      url = "www.infojobs.net/ofertas-trabajo/#{word}/#{province}"
      a = Mechanize.new    
      a.user_agent = 'Mac Safari'
      a.get(url).search("td.vacant a").each do |oferta|
        job = Job.new
        job.title = oferta.text
        job.link = "http:"+ oferta.attributes["href"].value
        job.save
      end
    end
end
