{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  cryptography,
}:

buildPythonPackage rec {
  pname = "certipy";
  version = "0.2.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TocB5qLygeehVMLzaM/07fN0AJCE0peIy+jDg4iXeE8=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "certipy" ];

  meta = {
    description = "Utility to create and sign CAs and certificates";
    homepage = "https://github.com/LLNL/certipy";
    license = lib.licenses.bsd3;
  };
}
