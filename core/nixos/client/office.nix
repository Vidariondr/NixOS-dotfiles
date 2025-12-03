{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt # Office suite
    # Spelling-checker packages
    hunspell
    hunspellDicts.en_GB-ise
    hunspellDicts.en_US
    hunspellDicts.pl_PL
  ];

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
  ];
}
