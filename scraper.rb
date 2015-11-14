#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_5-րդ_գումարման_պատգամավորներ', 'hy').wikidata_ids.each do |id|
  data = WikiData::Fetcher.new(id: id).data('hy') or next
  ScraperWiki.save_sqlite([:id], data)
end

require 'rest-client'
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']

