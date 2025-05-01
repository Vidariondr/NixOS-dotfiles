{ config, ... }:
{
  # Enable sound.
  # Enable ReaTimeKit, which hands out realtime scheduling priority
  # to user processes on demand.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
