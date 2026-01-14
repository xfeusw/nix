{
  Markdown = {
    format_on_save = "on";
    use_on_type_format = true;
    remove_trailing_whitespace_on_save = true;
  };

  Nix = {
    formatter = "language_server";
    language_servers = [
      "nixd"
      "!nil"
    ];
  };

  TypeScript = {
    language_servers = [
      "typescript-language-server"
      "deno"
      "!vtsls"
      "!eslint"
    ];
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  TSX = {
    language_servers = [
      "typescript-language-server"
      "deno"
      "!eslint"
      "!vtsls"
    ];
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  JavaScript = {
    language_servers = [
      "typescript-language-server"
      "!eslint"
    ];
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  JSX = {
    language_servers = [
      "typescript-language-server"
      "!eslint"
    ];
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  CSS = {
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  SCSS = {
    formatter = "language_server";
    format_on_save = "off";
    tab_size = 2;
  };

  JSON = {
    formatter = "language_server";
    format_on_save = "on";
    tab_size = 2;
  };

  HTML = {
    formatter = "language_server";
    format_on_save = "on";
    tab_size = 2;
  };

  Haskell = {
    format_on_save = "off";
  };

  Rust = {
    language_servers = [
      "rust_analyzer"
    ];
    # formatter = "language_server";
    # format_on_save = "on";
    tab_size = 2;
  };

  Elm = {
    language_servers = [
      "elm-language-server"
    ];
    formatter = "language_server";
    format_on_save = "on";
    tab_size = 2;
  };

  Just = {
    format_on_save = "off";
  };
}
