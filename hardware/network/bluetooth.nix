# Bluetooth Configuration
#- <https://nixos.wiki/wiki/Bluetooth>
{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    hsphfpd.enable = false;
  };
}
