'use strict'
const os = require('os')
const path = require('path')
const {createSymlink, executor} = require('../utils')

// dotfile names, in dotfiles folder
const VIMRC = 'vimrc'

const commands = [
  'set -e',
  'brew install vim',
  `mkdir -p "${path.join(os.homedir(), '.vim')}"`,
  `mkdir -p "${path.join(os.homedir(), '.vim', 'swapfiles')}"`,
  'vim +PlugInstall +qall',
]

createSymlink(VIMRC)

commands.forEach(executor)
