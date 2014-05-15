require 'date'
module  Fx::ExchangeRate
 extend ActiveSupport::Concern
  
 module ClassMethods
  
  def at(date = Date.today, base_currency, counter_currency)
    base =  base_currency.upcase
    counter = counter_currency.upcase
      
    #GBP/GBP
     puts 'calculating base currency rate'
     base(base, date)
    
     puts 'calculating fx rate'
     counter(counter, date)

   end
  
   def counter(counter, date)
     #d =  ExchangeRate.by_currency(counter).by_date(date) 
     d = ExchangeRate.by_currency(counter) 
     e = d.first
     @counter_rate = e.rate.to_f
     @counter_to_base_fx_rate = (@counter_rate / @base_rate).round(4)
    end
  
    def base (base, date)
      puts'from base method'
      a = ExchangeRate.by_currency(base) 
      #a =  EXchangeRate.by_currency(base).by_date(date) 
       b = a.first
       @base_rate = b.rate.to_f
       puts @base_rate
       @base_to_base_fx_rate = ( @base_rate / @base_rate).round(4)
     end
   
     def convert(date, amount, base_currency, counter_currency)
       @rate = at(date, base_currency, counter_currency)
       @converted_amount =  @rate *  amount.to_f
       puts "the converted amount is #{@converted_amount}"
     end
  
  end 
end 