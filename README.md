# Config files

* Operating System: [Arch Linux](https://archlinux.org/)
* Windows Manager: [bspwm](https://github.com/baskerville/bspwm) with [sxhkd](https://github.com/baskerville/sxhkd)
* Terminal: [alacritty](https://github.com/alacritty/alacritty)
* Shell: [fish](https://fishshell.com/)
* Editor: [Neovim](https://neovim.io/)
* Info bar: [polybar](https://github.com/polybar/polybar)
* App launcher: [rofi](https://github.com/davatorium/rofi)

# Usage

## Save local config to git config

```bash
python manage.py save -e "Desktop" -p config.json
```

## Deploy git config to local config

```bash
python manage.py deploy -e "Desktop" -p config.json
```
