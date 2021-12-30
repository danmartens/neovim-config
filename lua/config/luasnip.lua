return function()
  local luasnip = require('luasnip')
  -- some shorthands...
  local snippet = luasnip.snippet
  -- local sn = luasnip.snippet_node
  local text = luasnip.text_node
  local insert = luasnip.insert_node
  -- local f = luasnip.function_node
  -- local c = luasnip.choice_node
  -- local d = luasnip.dynamic_node
  -- local r = luasnip.restore_node

  luasnip.snippets = {
    ruby = {
      snippet('has_many', {
        text('has_many :'),
        insert(0),
      }),
    },
    typescriptreact = {
      snippet('imreact', {
        text("import * as React from 'react';"),
      }),
      snippet('imcore', {
        text("import * as Core from 'src/components/core';"),
      }),
      snippet('refunc', {
        text('const '),
        insert(0, 'ComponentName'),
        text(': React.FC<Props> = (props) => {'),
        text('return (<div>'),
        insert(1),
        text('</div>);'),
        text('};'),
      }),
    },
  }
end
