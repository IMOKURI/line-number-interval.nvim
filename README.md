# Line Number Interval for Neovim

Set line number by each XX lines.

[![Build Status](https://travis-ci.org/IMOKURI/line-number-interval.nvim.svg?branch=master)](https://travis-ci.org/IMOKURI/line-number-interval.nvim)

## Screenshots

### set number

![line-number-interval](https://user-images.githubusercontent.com/1638500/66383495-12517400-e9f8-11e9-98f2-e74bb17952fc.gif)

### set relativenumber

![line-number-interval-relative](https://user-images.githubusercontent.com/1638500/66383521-1e3d3600-e9f8-11e9-98d4-4b604fd45fdc.gif)

## Requirements

- Neovim 0.3.2

## Configurations

``` vim
" Enable line number interval at startup.
let g:line_number_interval#enable_at_startup = 1

" Set interval to display line number. (default: 10)
let g:line_number_interval = 5
```

## Commands

- `LineNumberIntervalEnable`: Enable line number interval.
- `LineNumberIntervalDisable`: Disable line number interval.
- `LineNumberIntervalToggle`: Toggle line number interval.

## FAQ

Q. Can I hide folded line number?

A. Unfortunately, it's not possible.
The whole line belongs to the `Folded` highlight group.

## ToDo

- Document
