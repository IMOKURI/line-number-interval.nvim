# Line Number Interval for Neovim

Set line number by each XX lines.

## Screenshots

### set number

![set-number](https://user-images.githubusercontent.com/1638500/66323526-e1713080-e95e-11e9-9b1d-328cecbd7736.gif)

### set relativenumber

![set-relativenumber](https://user-images.githubusercontent.com/1638500/66323558-ee8e1f80-e95e-11e9-9435-8c86bbfdc75e.gif)

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

- Tests
- Document
