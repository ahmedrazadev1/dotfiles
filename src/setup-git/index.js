'use strict'
const {executor, createSymlink} = require('../utils')
const DOT_FILENAME = 'gitignore'

console.clear()
console.log('setting up the git ...')

const commands = [
  // hub: a github-specific version of git
  'brew install git hub',

  'git config --global alias.br branch',
  'git config --global alias.cm commit',
  'git config --global alias.cmm "commit -m"',
  'git config --global alias.co checkout',
  'git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit"',
  'git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit --all"',
  'git config --global alias.ls ls-files',
  'git config --global alias.st status',

  'git config --global color.ui true',

  'git config --global core.autocrlf input',
  'git config --global core.editor vim',
  'git config --global core.eol lf',
  'git config --global core.excludesfile "$HOME/.gitignore"',

  'git config --global credential.helper osxkeychain',

  'git config --global push.default current',

  'git config --global url.https://.insteadOf git://',

  'git config --global user.email "iamfotx@gmail.com"',
  'git config --global user.name "iamfotx"',
]

createSymlink(DOT_FILENAME)

commands.forEach(executor)

console.log('github settings completed.')
