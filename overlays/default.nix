self: super:
let
  omnixOverlay = import ./omnix.nix;
in
super // (omnixOverlay { inherit self super; })
