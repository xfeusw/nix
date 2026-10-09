{
  config,
  ...
}:
let
  dns = [
    "9.9.9.9"
    "149.112.112.112"
    "2620:fe::fe"
    "2620:fe::9"
  ];
  # Public: 8Dw46+cC3Vm5iC0sBVp1fQDmjrmoyV3qzu57Puni+Xo=
  privateKeyFile = "/home/xfeusw/.config/wireguard/privatekey";
in
{
  networking.wg-quick.interfaces = {
    wg-work =
      let
        subnet4 = address: "10.66.66.${toString address}/32";
        subnet6 = address: "fd00:fae:fae:fae:fae:${toString address}::/96";
      in
      {
        inherit dns privateKeyFile;
        address = [
          (subnet4 69)
          (subnet6 69)
        ];
        peers = [
          {
            # uzinfocom-1
            endpoint = "91.212.89.25:51820";
            allowedIPs = [
              (subnet4 1)
              (subnet6 1)
            ];
            publicKey = "h+Lj7eQ4yX72HXB954aZ19+Ug9DF8WiHijxwKbjYaik=";
          }
          {
            # uzinfocom-2
            endpoint = "91.212.89.28:51820";
            allowedIPs = [
              (subnet4 2)
              (subnet6 2)
            ];
            publicKey = "ZGnqqVHt5k7t+hEmjzc9vU22QXTalBjnAPjDI5QcvQo=";
          }
        ];
      };
  };

  networking.hosts = {
    "10.66.66.2" = [ "grafana.oss.uzinfocom.uz" ];
  };
}
