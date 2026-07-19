{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pbr,
  pyyaml,
  six,
  multi-key-dict,
  requests,
}:

buildPythonPackage rec {
  pname = "python-jenkins";
  version = "1.8.3";
  pyproject = true;

  src = fetchPypi {
    pname = "python_jenkins";
    inherit version;
    hash = "sha256-j0dhw5GsEejB8j93EBCSDBBEBJdwWrcXXVI1j1oS3Jg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pbr
    pyyaml
    setuptools
    six
    multi-key-dict
    requests
  ];

  pythonImportsCheck = [ "jenkins" ];

  meta = {
    description = "Python bindings for the remote Jenkins API";
    homepage = "https://pypi.org/project/python-jenkins/";
    license = lib.licenses.bsd3;
  };
}
