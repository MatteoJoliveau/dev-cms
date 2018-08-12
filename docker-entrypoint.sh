#!/usr/bin/env sh
rails db:migrate db:seed
puma -C config/puma.rb