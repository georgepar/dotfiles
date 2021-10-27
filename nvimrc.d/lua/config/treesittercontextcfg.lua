return function ()
    require('treesitter-context').setup({
        pattern = {
            default = {
                'class',
                'function',
                'method',
                'for',
                'while',
                'if'
            }
        }
    })
end

