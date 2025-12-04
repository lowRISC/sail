{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # OCaml toolchain
    ocaml
    opam
    dune_3
    
    # Dependencies
    gmp
    z3
    zlib
    
    # Build tools
    pkg-config
    m4
    
    # For generated C emulators
    gcc
    
    # Optional: for documentation
    asciidoctor
    
    # To run the binary
    bash
  ];
  
  shellHook = ''
    export SAIL_DIR=$PWD
    echo "Sail development environment"
    echo "Run 'opam install .  --deps-only' to install OCaml dependencies"
  '';
}