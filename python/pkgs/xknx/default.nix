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
  version = "3.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "XKNX";
    repo = "xknx";
    tag = finalAttrs.version;
    hash = "sha256-AW7l5uLaaZj86UFRaRa3dPTORkcVqoRypNmgCRswmV8=";
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
