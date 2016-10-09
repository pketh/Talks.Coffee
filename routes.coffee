app = require 'express'
_ = require 'underscore'
randomcolor = require 'randomcolor'
Airtable = require 'airtable'
Airtable.configure
  apiKey: process.env.AIRTABLE_API_KEY
base = Airtable.base process.env.AIRTABLE_BASE

router = app.Router()

TITLE = "Talks over Coffee"
DESCRIPTION = "Heartfelt dev talks for humans"
URL = "http://talks.coffee"
records = []

base('Videos').select().firstPage (error, records) ->
  if error
    console.log error
  else
    records

    router.get '/', (request, response) ->
      response.render 'index.jade',
        title: TITLE
        description: DESCRIPTION
        url: URL
        records: _.shuffle records
        randomcolors: randomcolor
          count: records.length
          luminosity: 'light'



module.exports = router
