# home/xfeusw/development/languages/nodejs.nix
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Node.js
    nodejs_22
    pnpm
    yarn
    package-version-server

    # OpenSSL for Prisma and other Node.js native modules
    openssl

    # Global Node.js tools
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"

    # Prisma dependencies
    prisma-engines # Provides Prisma engine binaries
    nodePackages.prisma # Prisma CLI for database management

    # Prisma dependencies (for query engine)
    pkg-config
    libuuid # Required for some Prisma setups
  ];

  # Environment variables for Prisma and Node.js
  home.sessionVariables = {
    # Prisma engine paths
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
    PRISMA_INTROSPECTION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/introspection-engine";

    # Fallback for checksum issues
    PRISMA_ENGINES_CHECKSUM_IGNORE_MISSING = "1";

    # Ensure OpenSSL is available
    OPENSSL_DIR = "${pkgs.openssl.dev}/";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";

    # Node.js global packages path
    NODE_PATH = "${pkgs.nodejs_22}/lib/node_modules";
  };
}
