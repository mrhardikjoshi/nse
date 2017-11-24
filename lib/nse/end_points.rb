module NSE::EndPoints
  EQUITY_LIST_CSV = 'https://www.nseindia.com/content/equities/EQUITY_L.csv'.freeze
  GET_QUOTE_PAGE = 'https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/GetQuote.jsp?'.freeze
  GET_QUOTE = 'https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/ajaxGetQuoteJSON.jsp?'.freeze
  GET_QUOTE_ALT = 'https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/ajaxGetQuoteILJSON.jsp?'.freeze

  QUOTE_HEADERS = {
    "Host" => "www.nseindia.com",
    "Connection" => "keep-alive",
    "Accept" => "*/*",
    "X-Requested-With" => "XMLHttpRequest",
    "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36",
    "If-Modified-Since" => "Sun, 29 Oct 2016 19:01:27 GMT",
    "Referer" => "https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/GetQuote.jsp?symbol=COALINDIA&illiquid=0&smeFlag=0&itpFlag=0"
  }.freeze

  def self.get_quote(equity_symbol)
    ["#{GET_QUOTE}symbol=#{equity_symbol}&series=EQ", QUOTE_HEADERS]
  end

  def self.get_quote_page(equity_symbol)
    "#{GET_QUOTE_PAGE}symbol=#{equity_symbol}&illiquid=0&smeFlag=0&itpFlag=0"
  end
end
