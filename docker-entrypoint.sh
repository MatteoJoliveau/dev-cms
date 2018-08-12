#!/usr/bin/env bash
rails db:migrate db:seed
puma -C config/puma.rb