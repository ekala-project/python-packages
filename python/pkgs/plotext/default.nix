{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "plotext";
  version = "6.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a3Kc5jdsXBwhUv6F4ESdzFSHnQkjs8bI0WcBCCRcb4Q=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "plotext" ];

  meta = {
    description = "Plotting directly in the terminal";
    mainProgram = "plotext";
    homepage = "https://github.com/piccolomo/plotext";
    license = lib.licenses.mit;
  };
}
