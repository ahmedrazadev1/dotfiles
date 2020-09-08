'use strict'
const os = require('os')
const whoami = os.userInfo().username

console.log(
  `Hey ${whoami}, go get some food 🍕🌮 while I'm setting up your Mac!`,
)

// requires
require('./setup-mac')
