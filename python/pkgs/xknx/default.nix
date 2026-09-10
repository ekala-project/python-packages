{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cryptography,
  ifaddr,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "xknx";
  version = "3.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "XKNX";
    repo = "xknx";
    tag = finalAttrs.version;
    hash = "sha256-/KUFf1d2+IcqGiLyX5mls7sMhfHU9KBgK1c/t2835WA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    ifaddr
  ];

  pythonImportsCheck = [ "xknx" ];

  meta = {
    description = "KNX Library Written in Python";
    homepage = "https://github.com/XKNX/xknx";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
})
