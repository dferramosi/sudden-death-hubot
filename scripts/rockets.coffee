# Description:
#   Announces when people are playing rocket League (or other games on steam for now, subject to change)
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot rocket list - lists SteamIDs
#   hubot rocket add - add SteamID to check list
#   rocket auth <STEAM_API_KEY> - Sets steam api key
#
# Notes:
#   Emits and catches "rocket_event" every (interval) to poll steam api
#
# Author:
#   bVector

module.exports = (robot) ->
  robot.brain.data.rockets ?= {}
  robot.brain.data.rockets.steamids ?= []
  robot.brain.data.rockets.ignores ?= []

  setInterval () ->
      if robot.brain.data.rockets.apikey? and robot.brain.data.rockets.steamids?
        robot.emit "rocket_event", {room: "#general"}
    , 60 * 1000

  robot.on "rocket_event", (rocket_event) ->
    console.log "Checking Steam...   Ignores: #{robot.brain.data.rockets.ignores}"
    
    robot.http(robot.brain.data.rockets.url).get() (error, response, body) ->
   	  data = JSON.parse body
   	  for player in data.response.players 
   	    playstring = "#{player.personaname+': '+player.gameextrainfo}"
   	    if playstring not in robot.brain.data.rockets.ignores
   	      robot.send rocket_event.room,  playstring
          robot.brain.data.rockets.ignores.push playstring
   	      setTimeout () ->
            robot.brain.data.rockets.ignores.pop playstring
          , 3600 * 1000
  
  robot.respond /rockets add (\d*)/i, (msg) ->
    robot.brain.data.rockets.steamids.push msg.match[1]

  robot.respond /rockets list/i, (msg) ->
    msg.send "SteamIDs: #{robot.brain.data.rockets.steamids.toString()}"

  robot.hear /rockets auth (.*)/i, (res) ->
    res.send "Updating API key"
    robot.brain.data.rockets.apikey = res.match[1]
    robot.brain.data.rockets.url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{robot.brain.data.rockets.apikey}&steamids=#{robot.brain.data.rockets.steamids.toString()}"
    res.http(robot.brain.data.rockets.url).get() (error, response, body) ->
   	  data = JSON.parse body
      res.send "#{x.personaname+': '+x.gameextrainfo}" for x in data.response.players