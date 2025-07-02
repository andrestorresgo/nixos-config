# /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  # Enable ZeroTier One service
  services.zerotierone = {
    enable = true;
    # List of ZeroTier Network IDs to join on startup
    # You can find your Network IDs on the ZeroTier Central website (my.zerotier.com)
    joinNetworks = [
      "60ee7c034aa644b3"
    ];
    # Optional: You can specify a port if needed, though default usually works
    # port = 9993;
    # Optional: For advanced configurations, you can use localConf
    # services.zerotierone.localConf = {
    #   settings = {
    #     allowTcpFallbackRelay = false;
    #   };
    # };
  };

  # It's often useful to enable IP forwarding if you plan to route traffic
  # through your NixOS machine to other devices on the ZeroTier network.
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    # "net.ipv6.conf.all.forwarding" = true; # Uncomment if you use IPv6
  };

  # If you have a firewall enabled (which is generally recommended),
  # you might need to allow traffic on your ZeroTier interfaces.
  # Replace 'ztXXXXXXXXXX' with your actual ZeroTier interface names (e.g., zt123abc45)
  # You can find these after ZeroTier connects, using `ip a`
  # networking.firewall.trustedInterfaces = [ "ztXXXXXXXXXX" ];
}