{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  uv-build,
  xmltodict,
}:

buildPythonPackage (finalAttrs: {
  pname = "datamodeldict";
  version = "0.9.11";
  pyproject = true;

  src = fetchPypi {
    pname = "datamodeldict";
    inherit (finalAttrs) version;
    hash = "sha256-ziLE297fyVJw2Fjz/GuinnSgZy7LuwZP9N3KPAXiEQw=";
  };

  build-system = [ uv-build ];

  dependencies = [ xmltodict ];

  # no tests

  pythonImportsCheck = [ "DataModelDict" ];

  meta = {
    description = "Class allowing for data models equivalently represented as Python dictionaries, JSON, and XML";
    homepage = "https://github.com/usnistgov/DataModelDict/";
    license = lib.licenses.mit;
  };
})
