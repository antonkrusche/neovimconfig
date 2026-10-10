-- nvim-navbuddy: an interactive, ranger-style outline you can drill into.
--
-- Opens a popup with the LSP document symbols:
--   left pane  = parent context
--   mid pane   = focused node + its siblings
--   right pane = children of the focused node (or the source, with `s`)
--
-- Workflow (see `g?` inside the popup for all keys):
--   j / k       next / previous sibling
--   l           descend into the focused node
--   h           go back up
--   0           jump to the top-most node (rough top-level outline)
--   s           toggle the source preview in the right pane
--   <CR> / o    jump to the focused symbol
--   q / <Esc>   close
-- Arrow keys are mapped below to mirror the nav layer (Up/Down/Left/Right),
-- since navbuddy only ships j/k/h/l by default.
--
-- Note: uses the maintained fork. The original SmiteshP repo is archived and
-- its README points here.
return {
    "hasansujon786/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim", -- already pulled in by hardtime
    },
    -- Load eagerly: navbuddy must register its LspAttach hook before your
    -- language servers attach. (config/lazy.lua also defaults custom plugins
    -- to lazy = false, but be explicit so the keymap doesn't make it lazy.)
    lazy = false,
    keys = {
        {
            "<leader>sO",
            function() require("nvim-navbuddy").open() end,
            desc = "Browse outline (Navbuddy)",
        },
    },
    -- `opts` is a function so we can require the actions module here; it is
    -- only evaluated once the plugin is on the runtimepath.
    opts = function()
        local actions = require("nvim-navbuddy.actions")
        return {
            lsp = { auto_attach = true },
            window = {
                border = "rounded",
                size = "60%",
                sections = {
                    right = {
                        -- "leaf" (default) previews only leaf nodes;
                        -- "always" shows the source for every focused node.
                        preview = "always",
                    },
                },
            },
            source_buffer = {
                follow_node = true, -- scroll the code window to the focused node
                highlight = true, -- highlight the focused node's scope
                reorient = "smart",
            },
            mappings = {
                -- Arrow keys (navbuddy ships only j/k/h/l). Up/Down happen to
                -- work via the cursor-line sync, but Left/Right do nothing
                -- unless mapped, so map all four for a consistent nav layer.
                ["<Up>"] = actions.previous_sibling(),
                ["<Down>"] = actions.next_sibling(),
                ["<Left>"] = actions.parent(),
                ["<Right>"] = actions.children(),

                -- Defaults that need plugins/options this config doesn't have.
                -- They only notify an error rather than crash, but disable them
                -- so the `g?` help stays honest.
                ["c"] = { callback = function() end, description = "disabled (needs Comment.nvim)" },
                ["f"] = { callback = function() end, description = "disabled (needs foldmethod=manual)" },
                ["F"] = { callback = function() end, description = "disabled (needs foldmethod=manual)" },
                -- NB: `t` (fuzzy find current level) is left as-is; it auto-detects
                -- Snacks, which this config has.
            },
        }
    end,
}
