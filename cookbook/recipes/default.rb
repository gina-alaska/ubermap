#
# Cookbook Name:: ubermap
# Recipe:: default
#
# Copyright (C) 2014 Scott Macfarlane
# 
# All rights reserved - Do Not Redistribute
#


include_recipe "ubermap::redis"
include_recipe "ubermap::database"
include_recipe "ubermap::nginx"
include_recipe "ubermap::application"
include_recipe "ubermap::unicorn"
# include_recipe "ubermap::sidekiq"