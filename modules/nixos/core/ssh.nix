{ ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      AllowUsers = [ "blueguy" ];
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };
}
