{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  graphql-core,
}:

buildPythonPackage rec {
  pname = "graphql-relay";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-H/HFEpg1bkgaC+AJzN/ySYMs5T8wVZwTOPIqDg0XJQw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "poetry_core>=1,<2" "poetry-core" \
      --replace-fail ', "setuptools>=59,<70"' ""
  '';

  build-system = [ poetry-core ];

  dependencies = [ graphql-core ];

  pythonImportsCheck = [ "graphql_relay" ];

  meta = {
    description = "Library to help construct a graphql-py server supporting react-relay";
    homepage = "https://github.com/graphql-python/graphql-relay-py/";
    license = lib.licenses.mit;
  };
}
