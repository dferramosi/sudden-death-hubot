# Description:
#   personality matrix
#
#   Function:
#       to leave our chat feeling hollow and empty when the bot dies

cloudflare = [':poop:flare', 'lulzflare', 'derpflare', 'herpesflare', 'downtimeflare']
kek = ['http://i.imgur.com/oWBhLjU.jpg', 'http://i.imgur.com/aheUOF1.jpg', 'http://i.imgur.com/0vyOajy.png', 'http://i.imgur.com/3TJqrki.png', 'http://i.imgur.com/Qo7Si7o.jpg','http://i.imgur.com/Y3EMYMy.png','http://i.imgur.com/2AqrbVy.jpg','http://i.imgur.com/jhqGVTR.jpg', 'http://i.imgur.com/BqjKRio.jpg?1', 'http://i.imgur.com/BTBS8pu.png', 'http://i.imgur.com/c7u9m3S.gif?1']
lyl = ['http://i.imgur.com/j9iUptM.jpg'] 

module.exports = (robot) ->

   #Stupid simple shit responses we enjoy:
   robot.hear /kek/i, (msg) ->
     msg.send msg.random kek

   robot.hear /lel/i, (msg) ->
     msg.send "http://i.imgur.com/QUFJp9S.jpg"

   robot.hear /lyl/i, (msg) ->
     msg.send msg.random lyl
   
   robot.hear /cloudflare/i, (msg) ->
     msg.send msg.random cloudflare

   robot.hear /rectum/i, (msg) ->
     msg.send "rectum? DAMN NEAR KILLED EM!"

#   robot.hear /fuck/i, (msg) -> #never uncomment this
#     msg.send "EARMUFFS!"

