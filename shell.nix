{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_20
  ];

  shellHook = ''
    if [ ! -d "node_modules" ] || [ ! -f "node_modules/.package-lock.json" ] || \
       [ "package-lock.json" -nt "node_modules/.package-lock.json" ]; then
      npm install
      cp package-lock.json node_modules/.package-lock.json
    fi
  '';
}