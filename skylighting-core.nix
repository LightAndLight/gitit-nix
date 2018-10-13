{ mkDerivation, aeson, ansi-terminal, attoparsec, base
, base64-bytestring, binary, blaze-html, bytestring
, case-insensitive, colour, containers, criterion, Diff, directory
, fetchgit, filepath, HUnit, hxt, mtl, pretty-show, QuickCheck
, random, regex-pcre-builtin, safe, stdenv, tasty, tasty-golden
, tasty-hunit, tasty-quickcheck, text, transformers, utf8-string
}:
mkDerivation {
  pname = "skylighting-core";
  version = "0.7.4";
  src = fetchgit {
    url = "https://github.com/jgm/skylighting";
    sha256 = "1i0qjjj4glf9cvlzlm2cdspqgc7p8pq2gqwpn4nbh4cy7lnibrbw";
    rev = "76e8b17e6046243f24b7833f447e21da35248fdb";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/skylighting-core; echo source root reset to $sourceRoot";
  configureFlags = [ "-fexecutable" ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal attoparsec base base64-bytestring binary
    blaze-html bytestring case-insensitive colour containers directory
    filepath hxt mtl regex-pcre-builtin safe text transformers
    utf8-string
  ];
  executableHaskellDepends = [
    aeson ansi-terminal base base64-bytestring binary bytestring
    case-insensitive colour containers directory filepath hxt
    regex-pcre-builtin safe text utf8-string
  ];
  testHaskellDepends = [
    aeson base bytestring containers Diff directory filepath HUnit
    pretty-show QuickCheck random tasty tasty-golden tasty-hunit
    tasty-quickcheck text
  ];
  benchmarkHaskellDepends = [
    base containers criterion directory filepath text
  ];
  homepage = "https://github.com/jgm/skylighting";
  description = "syntax highlighting library";
  license = stdenv.lib.licenses.bsd3;
}
