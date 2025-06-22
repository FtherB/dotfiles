require('render-markdown').setup({
    render_modes = true,
    heading = {
        sign = false,
        width = { 'full', 'full', 'block', 'block', 'block', 'block'},
        left_pad = 0,
        right_pad = 4,
        min_width = 4,
        backgronds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
        },
        foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
        },
    },
    code = {
        enabled = true,
        right_pad = 4,
        width = 'block',
        border = 'thick',
    }
})


vim.api.nvim_set_hl(0, 'RenderMarkdownH1bg', {bg = '#2d4554',blend=40,})
vim.api.nvim_set_hl(0, 'RenderMarkdownH2bg', {bg = '#233a26',blend=40,})
vim.api.nvim_set_hl(0, 'RenderMarkdownH3bg', {bg = '#3a3523',blend=40,})
