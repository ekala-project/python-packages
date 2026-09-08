{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  argcomplete,
  attrs,
  colorlog,
  dependency-groups,
  humanize,
  packaging,
  python-discovery,
  virtualenv,
}:

buildPythonPackage rec {
  pname = "nox";
  version = "2026.8.17";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jZxpybmWpZ2x6yxpaN6uvC7bxVMX0gWYG7xKNzUdPy4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    argcomplete
    attrs
    colorlog
    dependency-groups
    humanize
    packaging
    python-discovery
    virtualenv
  ];

  pythonImportsCheck = [ "nox" ];

  doCheck = false;

  meta = {
    description = "Flexible test automation for Python";
    homepage = "https://github.com/wntrblm/nox";
    license = lib.licenses.asl20;
  };
}
