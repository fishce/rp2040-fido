# Pico FIDO

Firmware for Raspberry Pi Pico (RP2040) FIDO2/U2F security key, based on [pico-fido](https://github.com/polhenarejos/pico-fido).

## Features

- FIDO2/CTAP2 (versions 2.0–2.3)
- U2F
- Resident (discoverable) keys
- Credential management
- OTP, OATH applets

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
git clone --recursive https://github.com/fishce/pico-fido.git
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

1. Hold **BOOTSEL** button on the Pico
2. Connect Pico to USB
3. Copy `pico_fido.uf2` to the **RPI-RP2** drive
4. Pico reboots automatically

## License

GPL-3.0. See [LICENSE](LICENSE).
