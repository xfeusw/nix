{ inputs, pkgs, ... }:
let
  mkExtensionSettings = builtins.mapAttrs (
    _: pluginId: {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
    }
  );
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = false;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      # Extensions
      # ExtensionSettings = mkExtensionSettings {
      #   "addon@darkreader.org" = "darkreader";
      #   "{78bf203b-51b1-425c-9500-dbc2a0e9cf4d}" = "unlock-medium-article";
      # };
    };
    profiles.default = {
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.urlbar.behavior" = "float";
        "zen.welcome-screen.seen" = false;
      };
      extensions = {
        packages = with firefox-addons; [
          ublock-origin
          darkreader
          # unlock-medium-article # we need to add this
        ];
      };
      mods = [
        "f4866f39-cfd6-4498-ab92-54213b8279dc" # Animations Plus
        "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
        "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # Better Active Tab
        "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
        "ae7868dc-1fa1-469e-8b89-a5edf7ab1f24" # Load Bar
        "87196c08-8ca1-4848-b13b-7ea41ee830e7" # Tab Preview Enhanced
        "642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
      ];
    };
  };
}
