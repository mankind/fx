class ExchangeRatesController < ApplicationController
  
   def index
    @converter = ExchangeRate.all.to_a
   # @currencies = ExchangeRate.by_distinct_currency
    @currenci = ExchangeRate.unique_currencies_array
    
    if params[:date]
      #Converter.convert('2014-05-06', 10, 'gbp', 'dkk')   
      @converted = ExchangeRate.convert(params[:date], params[:amount], params[:from], params[:to])
    end
     puts "display your value #{@converted}"
  end
end
