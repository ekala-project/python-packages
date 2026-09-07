{
  lib,
  buildPythonPackage,
  fetchPypi,
  jupyter-core,
  hatchling,
  python-dateutil,
  pyzmq,
  tornado,
  traitlets,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "jupyter-client";
  version = "8.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyter_client";
    inherit version;
    hash = "sha256-n3EWKU3KVfF4W+iABX1EVE25sVZ3GNksszxYiGr7lJc=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jupyter-core
    python-dateutil
    pyzmq
    tornado
    traitlets
    typing-extensions
  ];

  pythonImportsCheck = [ "jupyter_client" ];

  # Circular dependency with ipykernel
  doCheck = false;

  meta = {
    description = "Jupyter protocol implementation and client libraries";
    homepage = "https://github.com/jupyter/jupyter_client";
    license = lib.licenses.bsd3;
  };
}
