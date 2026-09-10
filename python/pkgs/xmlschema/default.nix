{
  lib,
  buildPythonPackage,
  elementpath,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xmlschema";
  version = "4.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sissaschool";
    repo = "xmlschema";
    tag = "v${version}";
    hash = "sha256-OEQUq98n9dUKR8tWokboDhozBCczYCUlqI2qUGaTHtw=";
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
