#!/usr/bin/env ruby

require 'uri'
require 'public_suffix'

if ARGV.length != 1
    puts "Usage: ruby #{File.basename(__FILE__)} <file-of-URLs>"
    exit 1
end

def extract_host(url)
    raise ArgumentError, "Need a string" unless url.kind_of? String
    stripped_url = url.strip
    uri = URI.parse(stripped_url) rescue nil
    uri.host if uri
end

def create_host_array(uris)
    raise ArgumentError, "Need an array" unless uris.kind_of? Array
    hosts = []
    uris.each do |uri|
        next unless uri
        hosts << extract_host(uri)
    end
    return hosts
end

def create_domain_array(domains)
    raise ArgumentError, "Need an array" unless domains.kind_of? Array
    registered_domains = []
    domains.each do |domain|
        next unless domain
        registered_domains << PublicSuffix.domain(domain)
    end
    return registered_domains.sort.uniq
end

websites = File.readlines(ARGV[0]).map(&:chomp)
hosts_array = create_host_array(websites)
registered_array = create_domain_array(hosts_array)

registered_array.each do |domain|
    next unless domain
    puts domain
end
