{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "pathlib-abc";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "pathlib_abc";
    inherit (finalAttrs) version;
    hash = "sha256-/NVvFHI0ZF4sWceuIoCLNMNkuyMfaF3dn5aIWu14qUw=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "pathlib_abc" ];

  meta = {
    description = "Python base classes for rich path objects";
    homepage = "https://github.com/barneygale/pathlib-abc";
    license = lib.licenses.psfl;
  };
})
