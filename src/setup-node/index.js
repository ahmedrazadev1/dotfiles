'use strict'
const {executor} = require('../utils')

console.clear()

const commands = [
  'echo "installing node (via nvm)"',
  // Install nvm
  'curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash',

  // Install and use node version 12 by default
  'nvm install 12',
  'nvm alias default 12',

  // Install yarn
  'curl -o- -L https://yarnpkg.com/install.sh | bash',

  'echo "node --version: $(node --version)"',
  'echo "npm --version: $(npm --version)"',
  'echo "yarn --version: $(yarn --version)"',

  'echo "installing a few global npm packages"',
  'yarn global add serve fkill-cli npm-quick-run \
semantic-release-cli npm-check-updates create-react-app prettier',
]

commands.forEach(executor)
