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

buildPythonPackage (finalAttrs: {
  pname = "nox";
  version = "2026.10.20";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-XaV8AJw9/ddiwGjZB5sXlm7JZ6nrAs2OvPAWqUbq9n8=";
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

  meta = {
    description = "Flexible test automation for Python";
    homepage = "https://github.com/wntrblm/nox";
    license = lib.licenses.asl20;
  };
})
