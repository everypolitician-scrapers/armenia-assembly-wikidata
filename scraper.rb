#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

members = WikiData::Category.new('Կատեգորիա:ՀՀ_ԱԺ_5-րդ_գումարման_պատգամավորներ', 'hy').member_titles
ex_members = WikiData::Category.new('Կատեգորիա:ՀՀ ԱԺ 5-րդ գումարման ընթացքում լիազորությունները դադարեցրած պատգամավորներ', 'hy').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { hy: members | ex_members })
