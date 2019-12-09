#!/bin/bash
set -e

cd "$(dirname $0)"

git remote add github    "git@github.com:andrew-aladev/ruby-nhp.git"    || true
git remote add bitbucket "git@bitbucket.org:andrew-aladev/ruby-nhp.git" || true
git remote add gitlab    "git@gitlab.com:andrew-aladev/ruby-nhp.git"    || true
