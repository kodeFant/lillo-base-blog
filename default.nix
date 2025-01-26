{ pkgs ? import <nixpkgs> {} }:

pkgs.buildNpmPackage {
              pname = "lillo-base-blog";
              version = "0.0.1";
              src = ./.;
              npmDepsHash = pkgs.lib.fakeHash;
              installPhase = ''
                mkdir -p $out
                npm run build
                cp -r _site/* $out
              '';
            };