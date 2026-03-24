{ ... }:
{
  services.wayvnc = {
    enable = false;
    autoStart = false;
    settings = {
      address = "0.0.0.0";
      port = 5900;
    };
  };
}
