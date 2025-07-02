{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  packages = [
    pkgs.python3
    pkgs.uv
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.libz
  ];

  shellHook = ''
    echo "Python with uv package manager is ready!"
    echo "Usage:"
    echo "  uv init              # Initialize a new project"
    echo "  uv add <package>     # Add a package"
    echo "  uv run <script>      # Run a script"
    echo "  uv sync              # Install dependencies"
    echo ""
    python --version
    uv --version
  '';
}