{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "patch-ng";
  version = "1.19.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-J0hHkvSsHBX+Lz5M7PdLuYM9M7dccVtx0Zn34efR94Y=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "patch_ng" ];

  meta = {
    homepage = "https://github.com/conan-io/python-patch";
    description = "Library to parse and apply unified diffs";
    license = lib.licenses.mit;
  };
})
