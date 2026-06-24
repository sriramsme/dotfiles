return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim'
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        
        -- NEW BINDINGS (no conflicts!):
        -- f = files/find
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find git files' })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = 'Find string (grep)' })
        vim.keymap.set('n', '<leader>fw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = 'Find word under cursor' })
        vim.keymap.set('n', '<leader>fW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = 'Find WORD under cursor' })
        
        -- Keep Ctrl+p for muscle memory (git files)
        vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Find git files' })
        
        -- h = help
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    end
}
