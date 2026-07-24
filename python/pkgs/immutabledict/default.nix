{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "immutabledict";
  version = "4.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+ESmaRBs/cc/R7Gp2gA3gvsX3JVaVMgJcuDZPRxjxRQ=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "immutabledict" ];

  meta = {
    homepage = "https://github.com/corenting/immutabledict";
    description = "Fork of frozendict, an immutable wrapper around dictionaries";
    license = lib.licenses.mit;
  };
}
