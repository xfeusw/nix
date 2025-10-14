{ pkgs, ... }:
{
  extensions = with pkgs.vscode-extensions; [
    enkia.tokyo-night
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "min-theme";
      publisher = "miguelsolorio";
      version = "latest";
      sha256 = "sha256-nEdYS9/cMS4dcbFje23a47QBZr9eDK3dvtkFWqA+OHU=";
    }
    {
      name = "min-darkest";
      publisher = "pyxel";
      version = "latest";
      sha256 = "";
    }
    {
      name = "synthwave-remix-min-darker";
      publisher = "FernaandoJr";
      version = "latest";
      sha256 = "";
    }
    {
      name = "minimalist-dark-theme";
      publisher = "kxGeou";
      version = "latest";
      sha256 = "";
    }
    {
      name = "gruvbox";
      publisher = "jdinhlife";
      version = "latest";
      sha256 = "";
    }
    {
      name = "gruvbox-concoctis";
      publisher = "wheredoesyourmindgo";
      version = "latest";
      sha256 = "";
    }
    {
      name = "gruvbox-draken-lords";
      publisher = "DrakenLords";
      version = "latest";
      sha256 = "sha256-9OlMOWF7e4HQH34/9UtmBoIiSNX+DFgYWlFhVh43vvY=";
    }
    {
      name = "gruvbox-glass";
      publisher = "JackPaget";
      version = "latest";
      sha256 = "";
    }
    {
      name = "dplanets-theme";
      publisher = "dP-faces";
      version = "latest";
      sha256 = "";
    }
    {
      name = "dark-mint-theme";
      publisher = "gusso";
      version = "latest";
      sha256 = "";
    }
    {
      name = "lotus-dark-theme";
      publisher = "Birdlinux";
      version = "latest";
      sha256 = "sha256-M1DIZZouSXITZdvV5KbW/RAKPuRb3oL75QYnn6PLYOE=";
    }
    {
      name = "darkwizard";
      publisher = "Gabbezeira";
      version = "latest";
      sha256 = "";
    }
    {
      name = "laetus";
      publisher = "10F";
      version = "latest";
      sha256 = "sha256-yTh//M5/ySbmD2QvpnigfbFQY9gONvKB+zn5QaGkxxk=";
    }
    {
      name = "one-dark-darker";
      publisher = "JoelCrosby";
      version = "latest";
      sha256 = "";
    }
    {
      name = "dark-magic-themes";
      publisher = "DavidMorais";
      version = "latest";
      sha256 = "";
    }
    {
      name = "subway-dark";
      publisher = "idleberg";
      version = "latest";
      sha256 = "";
    }
    {
      name = "dark-shell";
      publisher = "maximilionus";
      version = "latest";
      sha256 = "";
    }
    {
      name = "framer-dark";
      publisher = "hemlok";
      version = "latest";
      sha256 = "";
    }
    {
      name = "draco-dark";
      publisher = "Draco";
      version = "latest";
      sha256 = "sha256-Wu9klSqNa08JNMcJHOMSoJ5R6USMPLN8bzyln1XcdaY=";
    }
    {
      name = "evro-dark";
      publisher = "EvroHQ";
      version = "latest";
      sha256 = "";
    }
    {
      name = "dark-side-theme";
      publisher = "snndmnsz";
      version = "latest";
      sha256 = "";
    }
  ];
}
