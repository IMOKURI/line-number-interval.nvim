# Line Number Interval for Neovim

Highlight line number by each XX lines.

[![Build Status](https://travis-ci.org/IMOKURI/line-number-interval.nvim.svg?branch=master)](https://travis-ci.org/IMOKURI/line-number-interval.nvim)

## Screenshots

### set number

![highlight-line-number](https://user-images.githubusercontent.com/1638500/66444757-6b181f80-ea7f-11e9-8d26-20768193934e.gif)

### set relativenumber

![highlight-line-relative-number](https://user-images.githubusercontent.com/1638500/66444779-79663b80-ea7f-11e9-8c97-8fbd0552c6ca.gif)

## Requirements

- Neovim 0.3.2

## Configurations

``` vim
" Enable line number interval at startup. (default: 0(disable))
let g:line_number_interval#enable_at_startup = 1

" Set interval to highlight line number. (default: 10)
let g:line_number_interval = 5

" Set color to highlight and dim.
" (default: HighlightedLineNr use LineNr color,
"           DimLineNr use same as background color (it seems hide).)
highlight HighlightedLineNr guifg=White ctermfg=7
highlight DimLineNr guifg=Magenta ctermfg=5
```

## Commands

- `LineNumberIntervalEnable`: Enable line number interval.
- `LineNumberIntervalDisable`: Disable line number interval.
- `LineNumberIntervalToggle`: Toggle line number interval.

## FAQ

Q. Can I hide folded line number?

A. Unfortunately, it's not possible.
The whole line belongs to the `Folded` highlight group.

Q. Can I use this plugin for Vim?

A. Unfortunately, no.
This plugin uses `numhl` highlight group of `sign` feature.
Vim has not this highlight group...
