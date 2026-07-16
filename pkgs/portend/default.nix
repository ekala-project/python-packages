{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  tempora,
}:

buildPythonPackage rec {
  pname = "portend";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qp1Aqx+eFL231AH0IhDfNdAXybl5kbrrGFaM7fuMZIk=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  build-system = [ setuptools-scm ];

  dependencies = [ tempora ];

  pythonImportsCheck = [ "portend" ];

  meta = {
    homepage = "https://github.com/jaraco/portend";
    description = "Monitor TCP ports for bound or unbound states";
    license = lib.licenses.bsd3;
  };
}
