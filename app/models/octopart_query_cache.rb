require 'digest/sha2'

class OctopartQueryCache < ActiveRecord::Base
  attr_accessible :json_result, :query, :query_hash,:http_response

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
    if queries.is_a?(Hash)
      queries = [queries]
    end
    self.get_mash("#{self.url}/parts/match?queries=" + URI.encode(JSON.generate(queries)))
  end

  def self.get(call_url)
    sha2_hash = (Digest::SHA2.new << call_url).to_s;

    result = self.find_by_query_hash(sha2_hash)

    # TODO: we must also check how old it is
    if not result.nil? and result.query == call_url and result.http_response==200
      return  result
    end

    response = Net::HTTP.get_response(URI.parse(call_url+"&apikey=#{self.api_key}"))

    return OctopartQueryCache.create(query:call_url, query_hash:sha2_hash, json_result:response.body, http_response:response.code)


  end

  def hash_mash
    parsed = JSON.parse(self.json_result)
    return Hashie::Mash.new(parsed)
  end

  def self.get_mash(call_url)
    response = self.get(call_url)
    return response.hash_mash()
  end


end
