  { config, lib, ...}:

{
  services.pipewire = {
    enable = true;
    alsa.enable = false;
    alsa.support32Bit = false;
    pulse.enable = true;
  };
}
  
  
