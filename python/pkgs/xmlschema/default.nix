{
  lib,
  buildPythonPackage,
  elementpath,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xmlschema";
  version = "4.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sissaschool";
    repo = "xmlschema";
    tag = "v${version}";
    hash = "sha256-O34MHsP4BC5fALHDzXJBWGtcRifdL3dJNwW721QN4vA=";
  };

  build-system = [ setuptools ];

  dependencies = [ elementpath ];
  pythonImportsCheck = [ "xmlschema" ];

  meta = {
    description = "XML Schema validator and data conversion library for Python";
    homepage = "https://github.com/sissaschool/xmlschema";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
