{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      # OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    suppressXdgMigrationWarning = true;

    # profiles.xfeusw = {
    #   extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
    #     ublock-origin
    #     # yandexsearchengineextension
    #   ];

    #   # search = {
    #   #   force = true; # Needed for nix to overwrite search settings on rebuild
    #   #   default = ""; # Aliased to duckduckgo, see other aliases in the link above
    #   #   engines = {
    #   #     # My nixos Option and package search shortcut
    #   #     yandex = {
    #   #       name = "yandex";
    #   #       urls = [
    #   #         {
    #   #           template = "https://mynixos.com/search?q={searchTerms}";
    #   #           params = [
    #   #             {
    #   #               name = "query";
    #   #               value = "searchTerms";
    #   #             }
    #   #           ];
    #   #         }
    #   #       ];

    #   #       icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    #   #       definedAliases = ["@nx"]; # Keep in mind that aliases defined here only work if they start with "@"
    #   #     };
    #   #   };
    #   # };
    # };
  };
}
