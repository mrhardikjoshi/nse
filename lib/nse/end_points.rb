module NSE::EndPoints
  EQUITY_LIST_CSV = 'https://www.nseindia.com/content/equities/EQUITY_L.csv'.freeze
  GET_QUOTE = 'https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/ajaxPeerCompanies.jsp?symbol='.freeze

  def self.get_quote(equity_symbol)
    GET_QUOTE + equity_symbol
  end
end
