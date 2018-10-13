{ mkDerivation, aeson, ansi-terminal, attoparsec, base
, base64-bytestring, binary, blaze-html, bytestring
, case-insensitive, colour, containers, directory, fetchgit
, filepath, hxt, mtl, regex-pcre-builtin, safe, skylighting-core
, stdenv, text, utf8-string
}:
mkDerivation {
  pname = "skylighting";
  version = "0.7.4";
  src = fetchTarball "https://github.com/jgm/skylighting/archive/0.7.4.tar.gz";
  postUnpack = "sourceRoot+=/skylighting; echo source root reset to $sourceRoot";
  preConfigure = ''
    ${skylighting-core}/bin/skylighting-extract ${skylighting-core}/xml/*.xml
  '';
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal attoparsec base base64-bytestring binary
    blaze-html bytestring case-insensitive colour containers directory
    filepath hxt mtl regex-pcre-builtin safe skylighting-core text
    utf8-string
  ];
  homepage = "https://github.com/jgm/skylighting";
  description = "syntax highlighting library";
  license = stdenv.lib.licenses.gpl2;
}
