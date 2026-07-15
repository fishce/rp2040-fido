# RP2040 FIDO

FIDO2/U2F security key firmware for RP2040-based boards, based on [pico-fido](https://github.com/polhenarejos/pico-fido).

## Features

- FIDO2/CTAP2 (versions 2.0–2.3)
- U2F
- Resident (discoverable) keys
- Credential management
- OTP, OATH applets

## Supported Boards

- Raspberry Pi Pico / Pico W
- Any RP2040 board with USB and ≥1MB flash

## Requirements

- [CMake](https://cmake.org/) ≥ 3.13
- `arm-none-eabi-gcc` + `arm-none-eabi-newlib`
- Python 3

```bash
# Arch/CachyOS
sudo pacman -S cmake arm-none-eabi-gcc arm-none-eabi-newlib python
```

## Dependencies

Clone with submodules:

```bash
git clone --recursive https://github.com/fishce/rp2040-fido.git
```

Or fetch manually:

```bash
git submodule add https://github.com/raspberrypi/pico-sdk lib/pico-sdk
git submodule update --init --recursive
git submodule add https://github.com/polhenarejos/pico-keys-sdk pico-keys-sdk
```

## Build

```bash
./build.sh
```

Output: `build/pico_fido.uf2`

## Flash

1. Hold **BOOTSEL** button on the board
2. Connect to USB
3. Copy `pico_fido.uf2` to the **RPI-RP2** drive
4. Board reboots automatically

## License

GPL-3.0. See [LICENSE](LICENSE).
