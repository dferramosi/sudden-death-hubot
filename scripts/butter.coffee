# Description:
#   Butter passing robot responses
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   want to <some activity>
#
# Author:
#   bV

module.exports = (robot) ->
  robot.respond /want to (.+)/i, (msg) ->
    msg.send "I AM NOT PROGRAMMED FOR FRIENDSHIP"
