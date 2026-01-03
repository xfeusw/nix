self: super: {

  omnix = super.omnix.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ self.gcc12 ];
    buildInputs = (old.buildInputs or [ ]) ++ [ self.gcc12 ];

    stdenv = super.stdenv // {
      cc = self.gcc12;
      cxx = self.gcc12;
    };
  });
}
