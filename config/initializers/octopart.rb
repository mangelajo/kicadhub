class OctopartV3

  def self.api_key
    'c42dcc61'
  end

  def self.url
    "http://octopart.com/api/v3"
  end

  def self.part(part_id)
    self.get_mash("#{self.url}/parts/#{URI.encode(part_id)}?")
  end

  def self.parts(*args)
    args = args.first if args.length==1 and args.first.is_a?(Array)
    raise ArgumentError.new('Please specify at least 1 part uid') if args.length.zero?
    url_args = args.map {|uid| "uid=#{uid}"}
    self.get_mash("#{self.url}/parts/get_multi?#{url_args.join("&")}")
  end


  def self.match(queries)
    self.get_mash("#{self.url}/parts/match?queries=" + URI.encode(JSON.generate(queries)))
  end

  def self.get(call_url)
    Net::HTTP.get_response(URI.parse(call_url+"&apikey=#{self.api_key}"))
  end

  def self.get_mash(call_url)
    response = self.get(call_url)
    parsed = JSON.parse(response.body)
    return Hashie::Mash.new(parsed)
  end

end