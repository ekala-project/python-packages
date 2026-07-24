{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "mpmath";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mpmath";
    repo = "mpmath";
    tag = version;
    hash = "sha256-ykfKrpDri+4n9Y26S7nFl6nF0CV6V0A11ijmt8/apvg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  meta = {
    homepage = "https://mpmath.org/";
    description = "Pure-Python library for multiprecision floating arithmetic";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.unix;
  };
}
