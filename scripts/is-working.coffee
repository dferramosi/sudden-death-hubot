# Description:
#   Simple listener to allow a CI to do a get and confirm the hubot is running
#
# Configuration:
#   none
#
# Commands:
#   none
#
# URLS:
#   GET /hubot/isworking
#
# Author:
#   dferrantelli

module.exports = (robot) ->
  robot.router.get "/hubot/isworking", (req, res) ->
    res.end "isworking"