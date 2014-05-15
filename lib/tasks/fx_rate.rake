#rake fx_rates:update_fx_rate 


require_relative '../fetcher'

namespace :fx_rates do
  desc "Fetch exchange rate"
  task :update_fx_rate => :environment  do
    puts "Fx exchange rate now up to date."
      Fetcher.new.process_xml  
  end
end