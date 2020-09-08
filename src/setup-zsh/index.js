'use strict'
const {createSymlink} = require('../utils')

console.clear()
console.log('setup ZSH ...')

const DOT_FILENAME = 'zshrc'

createSymlink(DOT_FILENAME)

console.log('ZSH setup completed.')
