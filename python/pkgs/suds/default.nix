{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "suds";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "suds-community";
    repo = "suds";
    tag = "v${version}";
    hash = "sha256-YdL+zDelRspQ6VMqa45vK1DDS3HjFvKE1P02USVBrEo=";
  };

  build-system = [ setuptools ];

  env.SUDS_PACKAGE = "suds";
  pythonImportsCheck = [ "suds" ];

  meta = {
    description = "Lightweight SOAP python client for consuming Web Services";
    homepage = "https://github.com/suds-community/suds";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
