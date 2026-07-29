{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ci-py";
  version = "1.0.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-R/6bLsXOKGxiJDZUvvOuvLp3usEhfg698qvvgOwBXYk=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "'pytest-runner', " ""
  '';

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "ci" ];

  meta = {
    description = "Library for working with Continuous Integration services";
    homepage = "https://github.com/grantmcconnaughey/ci.py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
