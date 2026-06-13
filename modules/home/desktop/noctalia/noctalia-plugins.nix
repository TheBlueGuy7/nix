# Noctalia Plugins Configuration
# Maps to ~/.config/noctalia/plugins.json + per-plugin settings directories
#
# Enabled plugins:  file-search, tailscale
# Disabled plugins: arch-updater, network-manager-vpn, web-search

{ ... }:

{
  programs.noctalia-shell = {
    # ─── Plugin Sources & States ───────────────────────────────────────
    # Maps to ~/.config/noctalia/plugins.json
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        arch-updater = {
          enabled = false;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        file-search = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        network-manager-vpn = {
          enabled = false;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        web-search = {
          enabled = false;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };

    # ─── Per-Plugin Settings ───────────────────────────────────────────
    # Each key maps to the plugin's own settings.json
    pluginSettings = {
      tailscale = {
        refreshInterval = 5000;
        compactMode = true;
        showIpAddress = false;
        showPeerCount = false;
        hideDisconnected = true;
        hideMullvadExitNodes = true;
        showSearchBar = false;
        terminalCommand = "ghostty";
        sshUsername = "root";
        pingCount = 5;
        defaultPeerAction = "copy-ip";
        taildropEnabled = true;
        taildropDownloadDir = "~/Downloads";
        taildropReceiveMode = "operator";
        loginServer = "";
      };
    };
  };
}
