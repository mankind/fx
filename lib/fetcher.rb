require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'date'

#url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
#doc = Nokogiri::XML(open(url)).remove_namespaces!

class Fetcher
   def load_xml
      @doc = Nokogiri::XML(File.open('./lib/eurofx.xml') ).remove_namespaces!
      @doc.children.first.children[2].children
    end

    def process_xml
      load_xml
    
      @doc.xpath('//Cube/Cube').each do |cube|
        @cube = cube
        
        @cube.xpath('./Cube').each do |s|
         
          puts @data = s 
          puts 'okay'
          fetched_fx_rates = ExchangeRate.create(
            date: Date.parse(@cube.attr('time')).strftime('%Y-%m-%d'),
            :currency => @data.attr('currency'),
            :rate => @data.attr('rate') 
            ).inspect
          
          Rails.logger.debug("data is: #{fetched_fx_rates.inspect}")             
        end
     end 
      
  end
  
end


