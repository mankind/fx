class ExchangeRate < ActiveRecord::Base
  include  Fx::ExchangeRate
  attr_accessor :amount, :from_currency, :to_currency
  
  validates :date, :currency, :rate,  presence: true, uniqueness: true
  
  scope :by_date, -> (date) {where("date < ?", date)} 
  scope :by_currency, -> (currency) {where(currency: currency) } 
  scope :by_distinct_currency, -> {ExchangeRate.select("distinct id, currency")}
  scope :by_date_currency, -> {ExchangeRate.select("distinct date, currency")}
  scope :unique_currencies_array, -> {ExchangeRate.uniq.pluck(:currency)}
end
