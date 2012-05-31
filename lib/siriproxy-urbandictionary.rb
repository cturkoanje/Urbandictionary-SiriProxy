# encoding: UTF-8
require 'cora'
require 'siri_objects'
require 'httparty'
require 'pp'
require 'json'


class SiriProxy::Plugin::Urbandictionary < SiriProxy::Plugin
  def initialize(config)
  end
  
  listen_for /urban dictionary ([a-z]*)/i do |word|
	@response = Net::HTTP.get(URI.parse("http://urbanscraper.herokuapp.com/define/" + word + ".json"))
	@result = JSON.parse(@response)
	@def = @result["definition"]
	say "#{@def}"
	request_completed
  end
  listen_for /urbandictionary ([a-z]*)/i do |word|
	@response = Net::HTTP.get(URI.parse("http://urbanscraper.herokuapp.com/define/" + word + ".json"))
	@result = JSON.parse(@response)
	@def = @result["definition"]
	say "#{@def}"
	request_completed
  end
 
end
