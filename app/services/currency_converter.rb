class CurrencyConverter
  def self.convert(amount, from_currency, to_currency)
    rate = Money.default_bank.get_rate(from_currency, to_currency)
    Money.new(amount * rate, to_currency)
  end
end
