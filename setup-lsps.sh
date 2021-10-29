set -xe

LSP_BIN=${HOME}/opt/bin

GO111MODULE=on go install golang.org/x/tools/gopls@latest
npm install -g bash-language-server
wget https://github.com/clangd/clangd/releases/download/13.0.0/clangd-linux-13.0.0.zip
unzip clangd-linux-13.0.0.zip
mv clangd_13.0.0/bin/clangd ${LSP_BIN}
rm -r clangd_13.0.0 clangd-linux-13.0.0.zip
pip install --target=${LSP_PATH} cmake-language-server
npm install -g diagnostic-languageserver
npm install -g dockerfile-language-server-nodejs
npm install -g vscode-langservers-extracted
npm install -g pyright
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ${LSP_BIN}/rust-analyzer
chmod +x ${LSP_BIN}/rust-analyzer
curl -L https://github.com/latex-lsp/texlab/releases/download/v3.3.0/texlab-x86_64-linux.tar.gz | tar xvzf - > ${LSP_BIN}/texlab
chmod +x ${LSP_BIN}/texlab
npm install -g typescript typescript-language-server
npm install -g yaml-language-server
curl -L https://github.com/artempyanykh/zeta-note/releases/download/2021-08-22/zeta-note-linux > ${LSP_BIN}/zeta-note-linux
chmod +x ${LSP_BIN}/zeta-note-linux
mkdir tmp
cd tmp
wget https://github.com/sumneko/vscode-lua/releases/download/v2.4.7/lua-2.4.7.vsix
unzip lua-2.4.7.vsix
mv extension/server ${HOME}/opt/sumneko_lua
chmod +x ${HOME}/opt/sumneko_lua/bin/Linux/lua-language-server
ln -s ${HOME}/opt/sumneko_lua/bin/Linux/lua-language-server ${LSP_BIN}/
cd -
rm -r tmp
