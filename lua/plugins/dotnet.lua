-- C# setup
--
-- Primary language server: Roslyn (Microsoft.CodeAnalysis.LanguageServer),
-- the same server used by VS Code / Visual Studio, wired up through
-- seblyng/roslyn.nvim. It is considerably faster and more accurate on large
-- solutions than OmniSharp, handles multiple solutions, decompilation and
-- source-generated files natively (so omnisharp-extended is no longer needed).
--
-- On-save formatting is handled by the Roslyn server's formatter, which honors
-- the entire project .editorconfig (formatting, code style, naming conventions,
-- analyzers).
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
        "mason-org/mason.nvim",
        opts = {
            -- `roslyn` is not in the core Mason registry; the custom registry
            -- provides it (plus `roslyn-nightly`). `roslyn` tracks the version
            -- shipped with the VS Code C# extension.
            -- registries = {
            --     "github:mason-org/mason-registry",
            --     "github:Crashdummyy/mason-registry",
            -- },
            -- Installs the `roslyn` package, which provides the
            -- `roslyn-language-server` executable that roslyn.nvim auto-detects.
            ensure_installed = { "roslyn-language-server" },
        },
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {
            -- Uncomment if the solution lives in a parent directory and your
            -- files are not below the folder that contains it.
            -- broad_search = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {
                    -- Disabled in favour of Roslyn. Flip to `true` to fall back
                    -- to OmniSharp; the settings/handlers below then apply again.
                    enabled = false,
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
