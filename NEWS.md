## tippy 1.0.0

- Remove deprecated `call_tippy`
- Use packer for JavaScript
- Deprecate `tippy_class`, `with_tippy` in favour of 
`tippy_this` and `tippy` respectively.
- Removed `renderTippy` and `tippyOutput` functions, 
these were part of the htmlwidget which is useless.
- Initial `tippy_plot` to use plots in tooltips.
- Support new themes.
- Allow calling methods on tooltips (e.g.: disable, show, hide, etc.)
- Allow setting global theme, see [#3](https://github.com/JohnCoene/tippy/issues/3)

## tippy 0.1.0

Updated to tippy 3.2.0

- Deprecated `tippy_this` in favour of `with_tippy`.
