#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q17277248 }'
ids = EveryPolitician::Wikidata.sparql(query)

members5 = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_5-րդ_գումարման_պատգամավորներ', 'hy').member_titles
members6 = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_6-րդ_գումարման_պատգամավորներ', 'hy').member_titles
ex_members = WikiData::Category.new('Կատեգորիա:ՀՀ ԱԺ 5-րդ գումարման ընթացքում լիազորությունները դադարեցրած պատգամավորներ', 'hy').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { hy: members5 | members6 | ex_members })
