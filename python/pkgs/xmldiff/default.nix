{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  lxml,
}:

buildPythonPackage rec {
  pname = "xmldiff";
  version = "3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OA7E0FzvM/W3Bs94mrzISNJ3MNZ+AtwLTxEH4Wzpqq0=";
  };

  build-system = [ setuptools ];

  dependencies = [ lxml ];

  pythonImportsCheck = [ "xmldiff" ];

  meta = {
    description = "Creates diffs of XML files";
    homepage = "https://github.com/Shoobx/xmldiff";
    license = lib.licenses.mit;
  };
}
