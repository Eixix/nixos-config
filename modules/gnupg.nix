{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    verbose = true;
    pinentryFlavor = "gtk2";
    enableSshSupport = true;
  };
}
