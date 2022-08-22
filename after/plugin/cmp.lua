require('luasnip.loaders.from_lua').lazy_load()
require('luasnip/loaders/from_snipmate').lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.g.mapleader = ' '
vim.opt.termguicolors = true

local cmp = require 'cmp'
local ls = require 'luasnip'
-- local lspkind = require("lspkind")
local types = require 'luasnip.util.types'

--
My_Symbols = {
  Array = ' ', -- '謹',
  Boolean = ' ', --'ﬧ ',
  Class = ' ', -- ' ', -- ' ',
  Color = ' ', -- ' ', -- ' ',
  Constant = ' ', -- ' ',
  Constructor = ' ', -- ' ', -- ' ',
  Enum = ' ', -- '練 ', -- ' ',
  EnumMember = ' ', -- ' ',
  Event = ' ', -- ' ', -- ' ',
  Field = ' ', -- ' ', -- ' ',
  File = ' ', -- ' ',
  Folder = ' ', -- ' ',
  Function = ' ', -- ' ',
  Interface = ' ', -- '﨡', -- ' ',
  Keyword = ' ', -- ' ', -- ' ',
  Method = ' ', -- ' ',
  Module = ' ', -- ' ',
  Namespace = ' ', -- ' ',
  Number = ' ', -- '濫',
  Object = '謹',
  Operator = '璉 ', -- ' ',
  Package = ' ', -- ' ',
  Property = ' ', -- ' ', -- ' ',
  Reference = ' ', -- ' ', -- ' ' -- ' ',
  Snippet = ' ', -- ' ', -- ' ',
  Struct = ' ', --'פּ ', -- ' ',
  Text = ' ', -- ' ',
  TypeParameter = ' ', -- ' ', -- ' ', -- ' ',
  Unit = ' ', -- '塞 ', -- 'ﰩ '  --' ',
  Value = ' ', -- ' ',
  Variable = ' ', -- ' ', -- ' ',
}

-- local source_mapping = {
--     luasnip = "[snip]",
--     buffer = "[buf]",
--     nvim_lsp = "[LSP]",
--     nvim_lua = "[api]",
--     path = "[path]",
--     gh_issues = "[issues]",
--     -- cmp_tabnine = "[TabNine]",
--     latex_symbols = "symbol",
-- }

cmp.setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.abort(),
    ['<c-e>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { 'i', 'c' }
    ),
    ['<c-space>'] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
    ['<tab>'] = cmp.config.disable,
    ['<down>'] = cmp.config.disable,
    ['<up>'] = cmp.config.disable,
    -- Testing
    ['<c-q>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = cmp.config.sources {
    { name = 'luasnip', priority = 100 }, -- For luasnip users.
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path', option = { trailing_slash = true } },
    { name = 'cmp_tabnine' },
    { name = 'spell' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          local buf = vim.api.nvim_get_current_buf()
          local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
          if byte_size > 2048 * 2048 then
            return {}
          end
          return { buf }
        end,
      },
    },
  },
  sorting = {
    comparators = {
      function(...)
        return require('cmp_buffer'):compare_locality(...)
      end,
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },

  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[API]',
        path = '[Filesystem]',
        luasnip = '[Snippet]',
        spell = '[Spell]',
      })[entry.source.name]
      vim_item.kind = My_Symbols[vim_item.kind]
      return vim_item
    end,
  },

  -- formatting = {
  --     format = function(entry, vim_item)
  --               vim_item.kind = lspkind.presets.default[vim_item.kind]
  --               local menu = source_mapping[entry.source.name]
  --               -- if entry.source.name == 'cmp_tabnine' then
  --               --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
  --               --         menu = entry.completion_item.data.detail .. ' ' .. menu
  --               --     end
  --               --     vim_item.kind = ''
  --               -- end
  --               vim_item.menu = menu
  --               return vim_item
  --           end
  --       },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {
      name = 'path',
      option = {
        trailing_slash = true,
      },
    },
  }, {
    { name = 'nvim_lua' },
  }, {
    { name = 'cmdline' },
  }),
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'buffer' },
  },
})

-- TODO to lua
_ = vim.cmd [[
  augroup CmpFish
    au!
    autocmd Filetype fish lua require'cmp'.setup.buffer { sources = { { name = "fish" }, } }
  augroup END
]]
-- vim.cmd [[
--   augroup CmpTex
--     au!
--     autocmd Filetype tex lua require'cmp'.setup.buffer { sources = { { name = "latex_symbols" }, } }
--   augroup END
-- ]]

ls.config.set_config {
  history = false,
  update_events = 'TextChanged,TextChangedI',
  delete_check_events = 'TextChanged',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '<-- choiceNode', 'Comment' } },
      },
    },
  },
  ext_base_prio = 300,
  ext_prio_increase = 1,
  enable_autosnippets = true,
  store_selection_keys = '<Tab>',
  ft_func = function()
    return vim.split(vim.bo.filetype, '.', true)
  end,
}

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set('i', '<c-u>', require 'luasnip.extras.select_choice')
