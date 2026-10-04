-- C#: full .editorconfig support
--
-- On-save formatting is handled by OmniSharp's Roslyn formatter, which
-- honors the entire project .editorconfig (formatting, code style, naming
-- conventions, analyzers)
--
-- CSharpier, the LazyVim dotnet extra default, is disabled here: it is
-- opinionated and only respects a small subset of .editorconfig (indent
-- size, width, line endings, using directives). It stays installed and
-- remains usable from the terminal:
--   dotnet csharpier format .
return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                csharpier = {
                    condition = function()
                        return false
                    end,
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {
                    handlers = {
                        -- Route implementations through omnisharp-extended so that
                        -- `gI` (Goto Implementation, LazyVim default) resolves
                        -- metadata / source-generated locations, like Visual Studio.
                        -- The dotnet extra wires this only for definitions.
                        ["textDocument/implementation"] = function(...)
                            return require("omnisharp_extended").implementation_handler(...)
                        end,
                    },
                    settings = {
                        FormattingOptions = {
                            -- Read formatting, code style and naming rules from
                            -- the project's .editorconfig. This matches
                            -- nvim-lspconfig's default; set explicitly to pin the
                            -- behavior this config relies on.
                            EnableEditorConfigSupport = true,
                            -- Group and sort 'using' directives when formatting.
                            -- Replaces the dotnet extra's
                            -- `organize_imports_on_format = true`, which no longer
                            -- maps to current nvim-lspconfig options.
                            OrganizeImports = true,
                        },
                    },
                },
            },
        },
    },
}
