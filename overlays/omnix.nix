{
  self,
  super,
}:
let
  gccVersion = self.gcc13;
in
{
  omnix = super.omnix.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ gccVersion ];
    buildInputs = (old.buildInputs or [ ]) ++ [ gccVersion ];

    NIX_CC = gccVersion;
    NIX_CXX = gccVersion;
    CC = "${gccVersion}/bin/gcc";
    CXX = "${gccVersion}/bin/g++";

    PKG_CONFIG_PATH = old.PKG_CONFIG_PATH or "";

    # env = (old.env or { }) // {
    #   NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations -Wno-deprecated-declarations";
    # };

    stdenv = super.gcc13Stdenv;
  });
}
