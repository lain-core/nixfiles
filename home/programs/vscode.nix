{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Set up vscode with all the sauce.
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      ms-vscode.cpptools
      ms-python.python
      jnoorthee.nix-ide
      ms-vscode.hexeditor
    ];

    userSettings = {
      editor = {
        formatOnSave = true;
      };

      nix = {
        enableLanguageServer = true;
        serverPath = "nil";
        serverSettings = {
          nil = {
            formatting = {
              command = [ "nixpkgs-fmt" ];
            };
          };
        };
      };
    };
  };
}
