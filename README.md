# Tile3

Tile active window horizontaly on one third of the screen, left, center or right.

You can easily map tiling command to keyboard shortcuts according to your system.

## Requirements

Linux based system with (usually installed by default):

- wmctrl
- xrandr

Tested on Ubuntu 24.04.

## Usage

Run tile3.sh without parameters to display help message:

```
bash tile3.sh 
Move and resize active window to a third of the screen horizontaly.

Usage: tile3.sh POS OFFSET

  POS = target position L|C|R for left, center or right.
  Optionnal parameter:
    OFFSET = left side panel width to deduce for window width calculation. Defaults is 0.
```

**Note:** if some space is reserved by a left side panel on your desktop, you can set the optional `OFFSET` parameter to the width of your panel to take it in account during tiling.

### Example to tile the active window in the center

```bash
bash tile3.sh C
```

### Example to tile the active window on the left with a left side panel of 48 pixels width

```bash
bash tile3.sh L 48
```

## Tips

Combined with the up/down tiling positions, you can easily tile windows as a 2 rows x 3 columns as height is not affected by tile3

- First tile up or down your window
- Then use tile3 to tile left, center or right.

## Limits

If your window is maximized, tile3 does not work (yet).

