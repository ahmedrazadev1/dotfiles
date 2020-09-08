'use strict'
const os = require('os')
const shell = require('shelljs')
const whoami = os.userInfo().username

shell.exec('clear')
console.log(
  `Hey ${whoami}, go get some food 🍕🌮 while I'm setting up your Mac!`,
)

// requires
require('./setup-mac')
