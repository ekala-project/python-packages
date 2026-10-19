{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  xmltodict,
}:

buildPythonPackage (finalAttrs: {
  pname = "datamodeldict";
  version = "0.9.9";
  pyproject = true;

  src = fetchPypi {
    pname = "DataModelDict";
    inherit (finalAttrs) version;
    hash = "sha256-DadBRsc8qEu9PWgMNllGS2ESKL7kgBLDhg4yDr87WRk=";
  };

  build-system = [ setuptools ];

  dependencies = [ xmltodict ];

  # no tests

  pythonImportsCheck = [ "DataModelDict" ];

  meta = {
    description = "Class allowing for data models equivalently represented as Python dictionaries, JSON, and XML";
    homepage = "https://github.com/usnistgov/DataModelDict/";
    license = lib.licenses.mit;
  };
})
