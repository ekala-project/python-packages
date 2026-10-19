{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-radix";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mjschultz";
    repo = "py-radix";
    tag = "v${finalAttrs.version}";
    hash = "sha256-++QuZEwOHKjOsIbwLmDy30PvyG0Xe29l45PvOF+YWYw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "radix" ];

  meta = {
    description = "Python radix tree implementation for IPv4 and IPv6 prefix matching";
    homepage = "https://github.com/mjschultz/py-radix";
    license = lib.licenses.bsdOriginal;
  };
})
