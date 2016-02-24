#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_5-րդ_գումարման_պատգամավորներ', 'hy').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { hy: names })
