{ pkgs, ... }:
{
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      enkia.tokyo-night
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "min-theme";
        publisher = "miguelsolorio";
        version = "latest";
        sha256 = "sha256-DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
      }
      {
        name = "min-darkest";
        publisher = "pyxel";
        version = "latest";
        sha256 = "sha256-ikpXL4GVrEfnbc9ReSImbnNYPR8BHFebPC+YUuoZlr8=";
      }
      {
        name = "synthwave-remix-min-darker";
        publisher = "FernaandoJr";
        version = "latest";
        sha256 = "sha256-8Jv2suwvYym4YcGtDsvzg/WUbYpfePCzQk8gIP965Qk=";
      }
      {
        name = "minimalist-dark-theme";
        publisher = "kxGeou";
        version = "latest";
        sha256 = "sha256-iYGiQxbkSCi0Lkuylvfw8E27cRTxz/nNUyQr4AurFrs=";
      }
      {
        name = "gruvbox";
        publisher = "jdinhlife";
        version = "latest";
        sha256 = "sha256-LDbeCwuUxvyuacuvikZbV25iEtXWPRJ/ihnqpuM8Ky4=";
      }
      {
        name = "gruvbox-concoctis";
        publisher = "wheredoesyourmindgo";
        version = "latest";
        sha256 = "sha256-crjpGzJqjfVWcuO4kaGqtrs4Izhvh1QlWU7uurteLl8=";
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
        sha256 = "sha256-uxWMBJS6Ui+AGKD/zpkIzrAruMDvhzdMqQuHVAa7wKM=";
      }
      {
        name = "dplanets-theme";
        publisher = "dP-faces";
        version = "latest";
        sha256 = "sha256-NF3V06gKWTrJwh0Cq2TOGoUZmSBtA0lw5GGNtpI9Pts=";
      }
      {
        name = "dark-mint-theme";
        publisher = "gusso";
        version = "latest";
        sha256 = "sha256-Fd8GjNdHChOB+AUaihbDHWmX/wJMULKx4abzvWDLX2w=";
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
        sha256 = "sha256-czhwPOXY7THCBxKaA6WW5bGGPlWzYFrpZGAXWMct1Y8=";
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
        sha256 = "sha256-Rgun6TZGhVlvGX8ap1Mqlk2XbLIUKC+z6VbyPmiZj4g=";
      }
      {
        name = "dark-magic-themes";
        publisher = "DavidMorais";
        version = "latest";
        sha256 = "sha256-IeKQPNNLugvSgBui1VlKEgZmCKtVBZmd+ieFDtH/ObQ=";
      }
      {
        name = "subway-dark";
        publisher = "idleberg";
        version = "latest";
        sha256 = "sha256-S8mtaf1YcI1bqHVAtGW/zDi/rV6Au9MG1liJ2WhY9C8=";
      }
      {
        name = "dark-shell";
        publisher = "maximilionus";
        version = "latest";
        sha256 = "sha256-NQ/ud29r/6Z1JpzhNdX6SeIBjsi8cC+KOOKkkvFzIHI=";
      }
      {
        name = "framer-dark";
        publisher = "hemlok";
        version = "latest";
        sha256 = "sha256-uu7xQ09qM9MILl3FqKfMpdr/3jr0FDR3bA+/yaT5BwY=";
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
        sha256 = "sha256-s6hN9y+imvPLBOHauOtelecfrb5N/E2lPVjjD1mFaBA=";
      }
      {
        name = "dark-side-theme";
        publisher = "snndmnsz";
        version = "latest";
        sha256 = "sha256-OCz6alc780TtLCns2XdAiHDYJa8D6W06O4fPyAUwmCY=";
      }
    ];
  };
}
