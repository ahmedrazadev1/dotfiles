'use strict'
const os = require('os')
const path = require('path')
const {createSymlink, executor} = require('../utils')

console.clear()
console.log('setup Vim ...')
// dotfile names, in dotfiles folder
const DOT_FILENAME = 'vimrc'

const commands = [
  'set -e',
  'brew install vim',
  `mkdir -p "${path.join(os.homedir(), '.vim')}"`,
  `mkdir -p "${path.join(os.homedir(), '.vim', 'swapfiles')}"`,
  'vim +PlugInstall +qall',
]

createSymlink(DOT_FILENAME)

commands.forEach(executor)

console.log('Vim setup completed.')
