'use strict'
const createSymlink = require('./symlink')
const {execSync} = require('child_process')

function executor(command) {
  console.log(`Executing: ${command}`)
  try {
    execSync(command)
  } catch (e) {
    console.error(`Error: ${command} failed!`)
  }
}

exports.executor = executor
exports.createSymlink = createSymlink
