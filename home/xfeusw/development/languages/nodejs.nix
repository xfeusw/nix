# home/xfeusw/development/languages/nodejs.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Node.js
    nodejs_22
    pnpm
    yarn

    # Global tools
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"
  ];
}
