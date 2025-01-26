{ pkgs ? import <nixpkgs> {} }:

pkgs.buildNpmPackage {
              pname = "lillo-base-blog";
              version = "0.0.1";
              src = ./.;
              npmDepsHash = "sha256-fW2c5IQzyxoo17YSYM90Q+MGVdzjR9eL11PkigPRWt4=";
              installPhase = ''
                mkdir -p $out
                npm run build
                cp -r _site/* $out/
              '';
            }