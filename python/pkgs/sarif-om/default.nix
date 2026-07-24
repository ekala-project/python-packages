{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pbr,
  attrs,
}:

buildPythonPackage rec {
  pname = "sarif-om";
  version = "1.0.4";
  pyproject = true;

  src = fetchPypi {
    pname = "sarif_om";
    inherit version;
    hash = "sha256-zV9BazCD4A1AKpLkSaf/Z69G8RJBBz7qBGGAKjta75g=";
  };

  build-system = [
    setuptools
    pbr
  ];

  dependencies = [ attrs ];

  pythonImportsCheck = [ "sarif_om" ];

  meta = {
    description = "Classes implementing the SARIF 2.1.0 object model";
    homepage = "https://github.com/microsoft/sarif-python-om";
    license = lib.licenses.mit;
  };
}
