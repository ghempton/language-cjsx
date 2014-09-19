path   = require('path')

isCJSX = (text) ->
  PRAGMA = /^\s*#\s*@cjsx\s+(\S*)/im
  text.match(PRAGMA) isnt null

module.exports = activate: () ->
  atom.workspace.eachEditor (editor) ->
    if path.extname(editor.getPath()) is '.cjsx' or isCJSX(editor.getText())
      cjsxGrammar = atom.syntax.grammarsByScopeName['source.coffee.cjsx']
      editor.setGrammar cjsxGrammar if cjsxGrammar
