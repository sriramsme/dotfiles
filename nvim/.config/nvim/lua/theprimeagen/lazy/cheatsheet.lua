return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>?",
                function()
                    local pickers = require("telescope.pickers")
                    local finders = require("telescope.finders")
                    local conf = require("telescope.config").values
                    local actions = require("telescope.actions")
                    local action_state = require("telescope.actions.state")

                    -- Define your commands here
                    local commands = {
                        -- ESSENTIAL - Most Used
                        { cmd = "Ctrl+f", desc = "Find Git files (like VS Code)", category = "⭐ ESSENTIAL" },
                        { cmd = "Space f f", desc = "Find ALL files", category = "⭐ ESSENTIAL" },
                        { cmd = ":e filename", desc = "Create/open file (save with :w)", category = "⭐ ESSENTIAL" },
                        { cmd = ":w", desc = "Save file", category = "⭐ ESSENTIAL" },
                        { cmd = ":q", desc = "Quit", category = "⭐ ESSENTIAL" },
                        { cmd = "gd", desc = "Go to definition", category = "⭐ ESSENTIAL" },
                        { cmd = "K", desc = "Show hover documentation", category = "⭐ ESSENTIAL" },
                        { cmd = "Ctrl+o", desc = "Jump back to previous location", category = "⭐ ESSENTIAL" },
                        { cmd = "Ctrl+i", desc = "Jump forward", category = "⭐ ESSENTIAL" },
                        { cmd = "u", desc = "Undo", category = "⭐ ESSENTIAL" },
                        { cmd = "Ctrl+r", desc = "Redo", category = "⭐ ESSENTIAL" },
                        { cmd = "Space f s", desc = "Find string in project (grep)", category = "⭐ ESSENTIAL" },
                        { cmd = "Space y", desc = "Copy to clipboard (visual mode)", category = "⭐ ESSENTIAL" },
                        { cmd = "p", desc = "Paste", category = "⭐ ESSENTIAL" },
                        { cmd = "Space s", desc = "Find & replace word under cursor", category = "⭐ ESSENTIAL" },
                        { cmd = "za", desc = "Toggle fold (open/close)", category = "⭐ ESSENTIAL" },
                        { cmd = "gcc", desc = "Toggle comment on line", category = "⭐ ESSENTIAL" },
                        { cmd = "gc (visual)", desc = "Comment selected lines", category = "⭐ ESSENTIAL" },
                        
                        -- FILE NAVIGATION
                        { cmd = "Space f g", desc = "Find Git files", category = "📁 Find" },
                        { cmd = "Space f w", desc = "Find word under cursor", category = "📁 Find" },
                        { cmd = "Space f W", desc = "Find WORD under cursor", category = "📁 Find" },
                        { cmd = "Space f h", desc = "Find help tags", category = "📁 Find" },
                        { cmd = "Space p v", desc = "Open file explorer", category = "📁 Find" },
                        
                        -- FILE MANAGEMENT
                        { cmd = ":e path/to/file", desc = "Create/open file (save with :w)", category = "📄 File Ops" },
                        { cmd = ":e %:h/newfile", desc = "Create file in same directory", category = "📄 File Ops" },
                        { cmd = ":w", desc = "Save file", category = "📄 File Ops" },
                        { cmd = ":w newname", desc = "Save as (rename)", category = "📄 File Ops" },
                        { cmd = ":saveas newname", desc = "Save as (rename)", category = "📄 File Ops" },
                        { cmd = "% (in netrw)", desc = "Create new file in explorer", category = "📄 File Ops" },
                        { cmd = "d (in netrw)", desc = "Create new directory in explorer", category = "📄 File Ops" },
                        { cmd = "R (in netrw)", desc = "Rename file in explorer", category = "📄 File Ops" },
                        { cmd = "D (in netrw)", desc = "Delete file in explorer", category = "📄 File Ops" },
                        { cmd = ":pwd", desc = "Show current directory", category = "📄 File Ops" },
                        { cmd = ":cd path", desc = "Change directory", category = "📄 File Ops" },
                        
                        -- HARPOON (Quick Files)
                        { cmd = "Space a", desc = "Add file to Harpoon", category = "🎯 Harpoon" },
                        { cmd = "Ctrl+e", desc = "Toggle Harpoon menu", category = "🎯 Harpoon" },
                        { cmd = "Alt+1", desc = "Jump to Harpoon file 1", category = "🎯 Harpoon" },
                        { cmd = "Alt+2", desc = "Jump to Harpoon file 2", category = "🎯 Harpoon" },
                        { cmd = "Alt+3", desc = "Jump to Harpoon file 3", category = "🎯 Harpoon" },
                        { cmd = "Alt+4", desc = "Jump to Harpoon file 4", category = "🎯 Harpoon" },
                        
                        -- LSP
                        { cmd = "Space v r r", desc = "Find all references", category = "💡 LSP" },
                        { cmd = "Space v d", desc = "Show diagnostic/error details", category = "💡 LSP" },
                        { cmd = "Space v c a", desc = "Code actions", category = "💡 LSP" },
                        { cmd = "Space v r n", desc = "Rename symbol", category = "💡 LSP" },
                        { cmd = "[d", desc = "Next diagnostic", category = "💡 LSP" },
                        { cmd = "]d", desc = "Previous diagnostic", category = "💡 LSP" },
                        { cmd = "Ctrl+h (insert)", desc = "Signature help", category = "💡 LSP" },
                        
                        -- COMPLETION
                        { cmd = "Ctrl+n (insert)", desc = "Next completion", category = "✨ Complete" },
                        { cmd = "Ctrl+p (insert)", desc = "Previous completion", category = "✨ Complete" },
                        { cmd = "Ctrl+y (insert)", desc = "Accept completion", category = "✨ Complete" },
                        { cmd = "Ctrl+Space", desc = "Trigger completion", category = "✨ Complete" },
                        
                        -- EDITING
                        { cmd = "i", desc = "Enter insert mode", category = "✏️ Edit" },
                        { cmd = "Esc", desc = "Exit to normal mode", category = "✏️ Edit" },
                        { cmd = "v", desc = "Visual mode (select text)", category = "✏️ Edit" },
                        { cmd = "V", desc = "Visual line mode", category = "✏️ Edit" },
                        { cmd = "dd", desc = "Delete line", category = "✏️ Edit" },
                        { cmd = "yy", desc = "Copy line", category = "✏️ Edit" },
                        { cmd = ".", desc = "Repeat last command", category = "✏️ Edit" },
                        { cmd = "Space p (visual)", desc = "Paste without losing register", category = "✏️ Edit" },
                        { cmd = "Space d", desc = "Delete to void register", category = "✏️ Edit" },
                        
                        -- COMMENTING
                        { cmd = "gcc", desc = "Toggle comment line", category = "💬 Comment" },
                        { cmd = "gc (visual)", desc = "Comment selection", category = "💬 Comment" },
                        { cmd = "gcap", desc = "Comment paragraph", category = "💬 Comment" },
                        { cmd = "gc2j", desc = "Comment current + 2 lines below", category = "💬 Comment" },
                        { cmd = "gc$", desc = "Comment from cursor to end of line", category = "💬 Comment" },
                        { cmd = "gcip", desc = "Comment inside paragraph", category = "💬 Comment" },
                        { cmd = "gbc", desc = "Toggle block comment", category = "💬 Comment" },
                        { cmd = "gb (visual)", desc = "Block comment selection", category = "💬 Comment" },
                        
                        -- MOVEMENT
                        { cmd = "w", desc = "Next word", category = "⬆️ Move" },
                        { cmd = "b", desc = "Previous word", category = "⬆️ Move" },
                        { cmd = "0", desc = "Start of line", category = "⬆️ Move" },
                        { cmd = "$", desc = "End of line", category = "⬆️ Move" },
                        { cmd = "gg", desc = "Top of file", category = "⬆️ Move" },
                        { cmd = "G", desc = "Bottom of file", category = "⬆️ Move" },
                        { cmd = "Ctrl+d", desc = "Half page down (centered)", category = "⬆️ Move" },
                        { cmd = "Ctrl+u", desc = "Half page up (centered)", category = "⬆️ Move" },
                        { cmd = "%", desc = "Jump to matching bracket", category = "⬆️ Move" },
                        
                        -- FOLDING
                        { cmd = "zR", desc = "Open all folds", category = "🗂️ Fold" },
                        { cmd = "zM", desc = "Close all folds", category = "🗂️ Fold" },
                        { cmd = "zc", desc = "Close fold", category = "🗂️ Fold" },
                        { cmd = "zo", desc = "Open fold", category = "🗂️ Fold" },
                        
                        -- GIT
                        { cmd = "Space g s", desc = "Git status", category = "🔀 Git" },
                        { cmd = "Space p (fugitive)", desc = "Git push", category = "🔀 Git" },
                        { cmd = "Space P (fugitive)", desc = "Git pull --rebase", category = "🔀 Git" },
                        { cmd = "gu (diff)", desc = "Get changes from target", category = "🔀 Git" },
                        { cmd = "gh (diff)", desc = "Get changes from merge", category = "🔀 Git" },
                        
                        -- TESTING
                        { cmd = "Space t r", desc = "Run nearest test", category = "🧪 Test" },
                        { cmd = "Space t v", desc = "Toggle test summary", category = "🧪 Test" },
                        { cmd = "Space t s", desc = "Run test suite", category = "🧪 Test" },
                        { cmd = "Space t d", desc = "Debug nearest test", category = "🧪 Test" },
                        
                        -- DEBUGGING
                        { cmd = "F8", desc = "Debug: Continue", category = "🐛 Debug" },
                        { cmd = "F10", desc = "Debug: Step over", category = "🐛 Debug" },
                        { cmd = "F11", desc = "Debug: Step into", category = "🐛 Debug" },
                        { cmd = "F12", desc = "Debug: Step out", category = "🐛 Debug" },
                        { cmd = "Space b", desc = "Toggle breakpoint", category = "🐛 Debug" },
                        { cmd = "Space B", desc = "Conditional breakpoint", category = "🐛 Debug" },
                        
                        -- FORMATTING
                        { cmd = "Space f", desc = "Format buffer", category = "🎨 Format" },
                        { cmd = "Space t t", desc = "Toggle Trouble diagnostics", category = "🎨 Format" },
                        
                        -- UTILITIES
                        { cmd = ":w", desc = "Save file", category = "💾 Save/Quit" },
                        { cmd = ":q", desc = "Quit", category = "💾 Save/Quit" },
                        { cmd = ":wq", desc = "Save and quit", category = "💾 Save/Quit" },
                        { cmd = ":q!", desc = "Quit without saving", category = "💾 Save/Quit" },
                        { cmd = ":wqa", desc = "Save all and quit", category = "💾 Save/Quit" },
                        { cmd = ":qa!", desc = "Quit all without saving", category = "💾 Save/Quit" },
                        { cmd = "Space u", desc = "Toggle Undotree", category = "🛠️ Utils" },
                        { cmd = "Space z z", desc = "Zen mode (width 90)", category = "🛠️ Utils" },
                        { cmd = "Space z Z", desc = "Zen mode (minimal)", category = "🛠️ Utils" },
                        { cmd = "Space Space", desc = "Source/reload config", category = "🛠️ Utils" },
                        
                        -- WINDOWS & BUFFERS
                        { cmd = "Ctrl+w s", desc = "Split horizontal", category = "🪟 Windows" },
                        { cmd = "Ctrl+w v", desc = "Split vertical", category = "🪟 Windows" },
                        { cmd = "Ctrl+w h/j/k/l", desc = "Navigate windows", category = "🪟 Windows" },
                        { cmd = "Ctrl+w q", desc = "Close window", category = "🪟 Windows" },
                        
                        -- SEARCH
                        { cmd = "/", desc = "Search forward", category = "🔍 Search" },
                        { cmd = "?", desc = "Search backward", category = "🔍 Search" },
                        { cmd = "n", desc = "Next search result", category = "🔍 Search" },
                        { cmd = "N", desc = "Previous search result", category = "🔍 Search" },
                        { cmd = "*", desc = "Search word under cursor", category = "🔍 Search" },
                    }

                    -- Create the picker
                    pickers.new({}, {
                        prompt_title = "Neovim Commands (Type to filter)",
                        finder = finders.new_table({
                            results = commands,
                            entry_maker = function(entry)
                                return {
                                    value = entry,
                                    display = function(e)
                                        local display_str = string.format(
                                            "%-25s  %-50s  %s",
                                            e.value.cmd,
                                            e.value.desc,
                                            e.value.category
                                        )
                                        return display_str
                                    end,
                                    ordinal = entry.cmd .. " " .. entry.desc .. " " .. entry.category,
                                }
                            end,
                        }),
                        sorter = conf.generic_sorter({}),
                        attach_mappings = function(prompt_bufnr, map)
                            actions.select_default:replace(function()
                                actions.close(prompt_bufnr)
                                local selection = action_state.get_selected_entry()
                                -- Copy command to clipboard for easy reference
                                vim.fn.setreg("+", selection.value.cmd)
                                vim.notify("Copied to clipboard: " .. selection.value.cmd, vim.log.levels.INFO)
                            end)
                            return true
                        end,
                    }):find()
                end,
                desc = "Search Neovim Commands",
            },
            {
                "<leader>ch",
                function()
                    -- Get the cheatsheet path
                    local cheatsheet_path = vim.fn.stdpath("config") .. "/cheatsheet.md"
                    
                    -- Check if file exists
                    if vim.fn.filereadable(cheatsheet_path) == 0 then
                        vim.notify("Cheatsheet not found at " .. cheatsheet_path, vim.log.levels.ERROR)
                        return
                    end
                    
                    -- Open in vertical split
                    vim.cmd("vsplit " .. cheatsheet_path)
                    
                    -- Make it read-only and set some nice options
                    vim.bo.readonly = true
                    vim.bo.modifiable = false
                    vim.wo.number = true
                    vim.wo.relativenumber = false
                    vim.wo.signcolumn = "no"
                    
                    -- Set a nice width
                    vim.cmd("vertical resize 85")
                end,
                desc = "Open Full Cheatsheet (Markdown)",
            },
        },
    },
}
