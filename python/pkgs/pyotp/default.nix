{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyotp";
  version = "2.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-0B6XA0Q2FrA8V8cAtcv/1WofkpwbD48DExvHjB/KnT8=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "pyotp" ];

  meta = {
    homepage = "https://github.com/pyauth/pyotp";
    description = "Python One Time Password Library";
    license = lib.licenses.mit;
  };
})
