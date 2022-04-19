{
  imports = [
    ./configuration.nix
  ];

  # Make it use predictable interface names starting with eth0
  boot.kernelParams = [ "net.ifnames=0" ];

  networking = {
    defaultGateway = "10.0.0.1";
    # Use google's public DNS server
    nameservers = [ "8.8.8.8" ];
    interfaces.eth0 = {
#      ipAddress = "140.238.86.163";
       ipAddress = "10.0.0.30";
      prefixLength = 24;
    };
  };

  kexec.autoReboot = false;

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOz+LYOHTATw39ivQx8kKL6rPyNyvrZW4/h2vEmuqnft keith@booky.local"
  ];
}
