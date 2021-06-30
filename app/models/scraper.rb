require 'nokogiri'
require 'open-uri'
require 'pry'


doc = Nokogiri::HTML(open('https://cnq.lotemovil.com.ar/'))
#puts doc.class
array_numeros =[]
array_modalidad_fecha =[]
array_recortado =[]

doc.css('div#quiniela-ext-1 .extracto-header').each do |elem|        
  array_modalidad_fecha.push elem.children.text.split(/\n\s*/)
  array_modalidad_fecha.each do |ele|
    ele.reject!{ |k| k == ""}
    #array_recortado<< ele
    end
end

doc.css('div#quiniela-ext-1-3 div').each do |elem|
  
  array_numeros.push elem.children.text.split(/\n\s*/)  
  
end
array_numeros.each do |ele|
    if ele.length == 3
      ele.reject!{ |k| k == ""}
      array_recortado<< ele
    end
end


    
#puts numero
pry.binding

