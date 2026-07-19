{ pkgs, config, ... }:

{
  # Enable Mullvad VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad; # `pkgs.mullvad` only provides the CLI tool, use `pkgs.mullvad-vpn` instead if you want to use the CLI and the GUI.

  # Enable Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "none";
  };

  networking.firewall.allowedUDPPorts = [
    config.services.tailscale.port
  ];

  environment.systemPackages = with pkgs; [
    tailscale

    mullvad-compass

    mullvad-browser
    tor-browser
  ];
}
