'use strict'
const path = require('path')
const fs = require('fs')
const os = require('os')

const dotfiles_dir = path.join(process.cwd(), 'src', 'dotfiles')
const home = os.homedir()

function createSymlink(filename) {
  const from = path.join(dotfiles_dir, filename)
  const to = path.join(home, `.${filename}`)
  console.log(`creating ${to} ...`)
  fs.symlink(from, to, err => {
    if (err) {
      console.error(`Error while creating ${filename}`)
    }
  })
}

module.exports = createSymlink
