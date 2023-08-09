{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b81af66deb21f73a70c67e5ea189568af53b1e8c.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.neovim-unwrapped
  ];

  shellHook = ''
    echo Running direnv and Nix 
  '';

  MY_ENVIRONMENT_VARIABLE = "world";

}
