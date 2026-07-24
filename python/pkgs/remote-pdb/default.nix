{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "remote-pdb";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LXDG9B4Oq/AWXo8b5Y+CqnpgWq6rjyrv65ziRkMQkcE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "remote_pdb" ];

  meta = {
    description = "Remote vanilla PDB (over TCP sockets)";
    homepage = "https://github.com/ionelmc/python-remote-pdb";
    license = lib.licenses.bsd2;
  };
}
