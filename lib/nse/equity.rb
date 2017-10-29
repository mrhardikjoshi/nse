require 'open-uri'

class NSE::Equity
  SYMBOL_MAPPING = 'SYMBOL'
  NAME_OF_COMPANY_MAPPING = 'NAME OF COMPANY'
  SERIES_MAPPING = ' SERIES'
  DATE_OF_LISTING_MAPPING = ' DATE OF LISTING'
  PAID_UP_VALUE_MAPPING = ' PAID UP VALUE'
  MARKET_LOT_MAPPING = ' MARKET LOT'
  ISIN_NUMBER_MAPPING = ' ISIN NUMBER'
  FACE_VALUE_MAPPING = ' FACE VALUE'
  attr_accessor :symbol, :name_of_company, :series, :date_of_listing, :paid_up_value, :market_lot, :isin_number, :face_value

  def initialize(attr_map)
    @symbol = attr_map[:symbol]
    @name_of_company = attr_map[:name_of_company]
    @series = attr_map[:series]
    @date_of_listing = attr_map[:date_of_listing]
    @paid_up_value = attr_map[:paid_up_value]&.to_i
    @market_lot = attr_map[:market_lot]&.to_i
    @isin_number = attr_map[:isin_number]
    @face_value = attr_map[:face_value]&.to_i
  end

  def self.get_list
    list_str = ''
    col_sep  = ','
    row_sep  = "\n"

    open(NSE::EndPoints::EQUITY_LIST_CSV, 'rb') { |rf| list_str = rf.read }
    equity_list_array = list_str.split(row_sep)

    headers = equity_list_array.shift.split(col_sep)
    index_of_symbol = headers.index(SYMBOL_MAPPING)
    index_of_name_of_company = headers.index(NAME_OF_COMPANY_MAPPING)
    index_of_series = headers.index(SERIES_MAPPING)
    index_of_date_of_listing = headers.index(DATE_OF_LISTING_MAPPING)
    index_of_paid_up_value = headers.index(PAID_UP_VALUE_MAPPING)
    index_of_market_lot = headers.index(MARKET_LOT_MAPPING)
    index_of_isin_number = headers.index(ISIN_NUMBER_MAPPING)
    index_of_face_value = headers.index(FACE_VALUE_MAPPING)

    equity_list_array.map do |row_str|
      row = row_str.split(col_sep)
      new(symbol: row[index_of_symbol], name_of_company: row[index_of_name_of_company], series: row[index_of_series], date_of_listing: row[index_of_date_of_listing], paid_up_value: row[index_of_paid_up_value], market_lot: row[index_of_market_lot], isin_number: row[index_of_isin_number], face_value: row[index_of_face_value])
    end
  end
end
