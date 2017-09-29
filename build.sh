#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
ruby lint.rb
erb slr.erb > slr.txt
erb flr.erb > flr.txt
erb html.erb > index.html
