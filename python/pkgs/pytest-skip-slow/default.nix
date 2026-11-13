{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  flit-core,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-skip-slow";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_skip_slow";
    inherit (finalAttrs) version;
    hash = "sha256-tW79Oabi8zPAF3R2enbSwTKBOaY1u6/CPi5ZnBKd0PI=";
  };

  build-system = [ flit-core ];

  buildInputs = [ pytest ];

  pythonImportsCheck = [ "pytest_skip_slow" ];

  meta = {
    description = "Pytest plugin to skip tests marked slow unless --slow is given";
    homepage = "https://github.com/okken/pytest-skip-slow";
    license = lib.licenses.mit;
  };
})
