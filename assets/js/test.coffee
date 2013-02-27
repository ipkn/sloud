parser = require './parser'
fs = require 'fs'
d = fs.readFileSync 'sample.txt', 'utf8'

console.log parser.parse(d)
