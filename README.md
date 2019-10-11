# Line Number Interval for Neovim

Highlight line number by each XX lines.

[![Build Status](https://travis-ci.org/IMOKURI/line-number-interval.nvim.svg?branch=master)](https://travis-ci.org/IMOKURI/line-number-interval.nvim)
[![codecov](https://codecov.io/gh/IMOKURI/line-number-interval.nvim/branch/master/graph/badge.svg)](https://codecov.io/gh/IMOKURI/line-number-interval.nvim)

## Screenshots

### set number

![highlight-line-number](https://user-images.githubusercontent.com/1638500/66444757-6b181f80-ea7f-11e9-8d26-20768193934e.gif)

### set relativenumber

![highlight-line-relative-number](https://user-images.githubusercontent.com/1638500/66444779-79663b80-ea7f-11e9-8c97-8fbd0552c6ca.gif)

### set relativenumber with custom interval (fibonacci sequence)

![highlight-line-relative-number-custom](https://user-images.githubusercontent.com/1638500/66466246-565a7c80-eabd-11e9-9ca8-1db2b0160c0a.gif)

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

" Enable to use custom interval. (default: 0(disable))
" This option is only for relativenumber.
let g:line_number_interval#use_custom = 1

" Set custom interval list.
" (default: fibonacci sequence ([1, 2, 3, 5, 8, 13, 21, 34, 55, ...]))
" This option is only for relativenumber.
let g:line_number_interval#custom_interval = [2, 4, 8, 16, 32, 64]
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
