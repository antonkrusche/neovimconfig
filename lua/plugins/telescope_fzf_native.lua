local build, enabled
if vim.fn.executable("cmake") == 1 then
    build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    enabled = true
elseif vim.fn.executable("make") == 1 then
    build = "make"
    enabled = true
else
    enabled = false
end

return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = build,
        enabled = enabled,
    },
}
