{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "simplejson";
  version = "3.20.2";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "simplejson";
    repo = "simplejson";
    tag = "v${version}";
    hash = "sha256-err3NWljoC6MxJoFSYuqLHGKfDcst6ya7myP9XIRbFc=";
  };

  pythonImportsCheck = [ "simplejson" ];

  meta = {
    description = "Extensible JSON encoder/decoder for Python";
    longDescription = ''
      simplejson covers the full JSON specification for both encoding
      and decoding, with unicode support. By default, encoding is done
      in an encoding neutral fashion (plain ASCII with \uXXXX escapes
      for unicode characters).
    '';
    homepage = "https://github.com/simplejson/simplejson";
    license = with lib.licenses; [
      mit
      afl21
    ];
  };
}
