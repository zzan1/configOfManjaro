#!/usr/bin/env bash

# cd 到目录下面，要确保有之前安装过的 package.json, 确保有 neovim， 和 yarn。检查 Health 都正常
set -O nounset
set -O errexit

cd ~/.config/coc/extensions

yarn add coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-emmet --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-html --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-tsserver --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-explorer --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-jedi --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-python --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-sh --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
yarn add coc-tabnine --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
