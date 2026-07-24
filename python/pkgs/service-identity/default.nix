{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,

  # dependencies
  attrs,
  cryptography,
  pyasn1,
  pyasn1-modules,
}:

buildPythonPackage rec {
  pname = "service-identity";
  version = "24.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyca";
    repo = "service-identity";
    tag = version;
    hash = "sha256-onxCUWqGVeenLqB5lpUpj3jjxTM61ogXCQOGnDnClT4=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  dependencies = [
    attrs
    cryptography
    pyasn1
    pyasn1-modules
  ];

  pythonImportsCheck = [ "service_identity" ];

  meta = {
    description = "Service identity verification for pyOpenSSL";
    homepage = "https://service-identity.readthedocs.io";
    license = lib.licenses.mit;
  };
}
