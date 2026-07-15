#!/bin/bash

# Build script for Pico U2F (no submodule version)
# Uses vendored Pico SDK from lib/pico-sdk

set -e

VERSION_MAJOR="7"
VERSION_MINOR="6"
SUFFIX="${VERSION_MAJOR}.${VERSION_MINOR}"

echo "Building Pico U2F firmware..."

# Check for required tools
if ! command -v cmake &> /dev/null; then
    echo "Error: cmake not found"
    echo "Install with: sudo pacman -S cmake"
    exit 1
fi

if ! command -v arm-none-eabi-gcc &> /dev/null; then
    echo "Error: arm-none-eabi-gcc not found"
    echo "Install with: sudo pacman -S arm-none-eabi-gcc arm-none-eabi-newlib"
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo "Error: python3 not found"
    echo "Install with: sudo pacman -S python"
    exit 1
fi

# Use the local vendored Pico SDK
export PICO_SDK_PATH="$(pwd)/lib/pico-sdk"

echo "Using Pico SDK at: ${PICO_SDK_PATH}"

# Create build directory
mkdir -p build
cd build

# Clean previous build
rm -rf *

# Configure for Raspberry Pi Pico (RP2040)
echo "Configuring for Raspberry Pi Pico..."
cmake .. -DPICO_BOARD=pico

# Build
echo "Building..."
make -j$(nproc)

# Copy UF2 file
if [ -f pico_fido.uf2 ]; then
    echo "Build successful!"
    echo "Firmware: $(pwd)/pico_fido.uf2"
    echo ""
    echo "To flash:"
    echo "1. Hold BOOTSEL button on Pico"
    echo "2. Connect Pico to USB"
    echo "3. Copy pico_fido.uf2 to RPI-RP2 drive"
    echo "4. Pico will reboot automatically"
else
    echo "Build failed!"
    exit 1
fi
