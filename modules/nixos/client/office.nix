{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt
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
