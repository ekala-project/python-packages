{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "simplejson";
  version = "4.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simplejson";
    repo = "simplejson";
    tag = "v${version}";
    hash = "sha256-fiuz78r0z2ZM2vVIPxhMwnJGiZGURwr1yGSe/uLgeCs=";
  };

  build-system = [ setuptools ];

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
