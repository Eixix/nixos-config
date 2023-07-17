{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    verbose = true;
    pinentryFlavor = "qt";
    enableSshSupport = true;
  };
}
