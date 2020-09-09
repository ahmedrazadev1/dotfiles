'use strict'
const createSymlink = require('./symlink')
const {execSync} = require('child_process')

function executor(command) {
  try {
    let stdout = execSync(command)
    stdout = stdout.toString()
    if (stdout) {
      console.log(stdout)
    }
  } catch (e) {
    console.error(`Command: ${command} failed!`)
  }
}

exports.executor = executor
exports.createSymlink = createSymlink
