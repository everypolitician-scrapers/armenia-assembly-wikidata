#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

has_p39_spq = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q17277248 }'
has_p39_ids = EveryPolitician::Wikidata.sparql(has_p39_spq)

has_parlid_spq = 'SELECT DISTINCT ?item { ?item wdt:P5213 [] }'
has_parlid_ids = EveryPolitician::Wikidata.sparql(has_parlid_spq)

members5 = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_5-րդ_գումարման_պատգամավորներ', 'hy').member_titles
members6 = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_6-րդ_գումարման_պատգամավորներ', 'hy').member_titles
ex_members = WikiData::Category.new('Կատեգորիա:ՀՀ ԱԺ 5-րդ գումարման ընթացքում լիազորությունները դադարեցրած պատգամավորներ', 'hy').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: has_p39_ids | has_parlid_ids, names: { hy: members5 | members6 | ex_members })
