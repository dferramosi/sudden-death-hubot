# Description:
#   Some shit that @mjm wanted
#
# Dependencies:
#   Lack of good taste
#
# Configuration:
#   None
#
# Commands:
#   oh my - george takei's words of wisdom
#
# Author:
#   awesinine

oh_my = [
	"http://i.imgur.com/TBo68Vx.gif",
	"https://www.youtube.com/watch?v=6nSKkwzwdW4",
	"http://i.imgur.com/X6UtmCL.png",
	"http://i.imgur.com/bUTfZKf.gif?1"
	"http://media.giphy.com/media/H7iEm8CKI9ZAs/giphy-facebook_s.jpg"
	"https://c1.staticflickr.com/5/4152/5062627393_04000fb1dd_b.jpg"
	"http://media.2oceansvibe.com/wp-content/uploads/2015/01/ohmy.png"
	"http://media1.swedishinvention.com/2015/04/oh_my.jpg"
	"http://i162.photobucket.com/albums/t267/dawges/George%20Takei/oh-my-sharp.gif"
]

module.exports = (robot) ->
  robot.hear /oh my/i, (msg) ->
    msg.send msg.random oh_my
