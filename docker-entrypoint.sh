#!/usr/bin/env sh
rails db:migrate
puma -C config/puma.rb