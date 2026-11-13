{
  lib,
  buildPythonPackage,
  fetchFromSourcehut,

  # build-system
  setuptools,

  # dependencies
  importlib-metadata,
  sqlparse,
  tabulate,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "yoyo-migrations";
  version = "9.0.0";
  pyproject = true;

  # 9.0.0 has no sdist on PyPI
  src = fetchFromSourcehut {
    vc = "hg";
    owner = "~olly";
    repo = "yoyo";
    rev = "v${finalAttrs.version}-release";
    hash = "sha256-y3dI1NCx/qYW1121ylq5Kk+ha3Rb8a4ObMQCPwiwxC4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    importlib-metadata
    sqlparse
    tabulate
    setuptools_80 # needs pkg_resources at runtime
  ];

  pythonImportsCheck = [ "yoyo" ];

  meta = {
    description = "Database schema migration tool";
    homepage = "https://ollycope.com/software/yoyo";
    license = lib.licenses.asl20;
  };
})
