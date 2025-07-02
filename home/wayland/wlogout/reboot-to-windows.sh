#! /run/current-system/sw/bin/bash

echo "Generating GRUB configuration..."
# Generate GRUB config and find Windows entry
windows_entry=$(/run/current-system/sw/bin/grub-mkconfig -o /dev/null 2>/dev/null | /run/current-system/sw/bin/grep -i "menuentry '.*windows" | /run/current-system/sw/bin/head -n 1 | /run/current-system/sw/bin/sed -n "s/menuentry '\([^']*\).*/\1/p")

if [ -z "$windows_entry" ]; then
    echo "Error: Windows boot entry not found"
    echo "Full GRUB configuration for debugging:"
    /run/current-system/sw/bin/grub-mkconfig -o /dev/null
    exit 1
fi

echo "Found Windows entry: $windows_entry"
echo "Setting as next boot target..."

# Set Windows as next boot entry
/run/current-system/sw/bin/grub-reboot "$windows_entry"

if [ $? -ne 0 ]; then
    echo "Error: Failed to set Windows as next boot entry"
    exit 1
fi

echo "Successfully set Windows as next boot target"
echo "Rebooting system..."

# Reboot the system
/run/current-system/sw/bin/reboot