require 'httparty'

module NSE::Requester
  def self.get(path, headers={})
    HTTParty.get(path, headers: headers)
  end

  def self.get_parsed(args)
    if args.is_a?(Array)
      get(*args)
    else
      get(args)
    end.parsed_response
  end
end
