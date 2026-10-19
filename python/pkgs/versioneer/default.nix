{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "versioneer";
  version = "0.29";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-WrKDuYVyEdYbUzGLfHks9o55jnZe4Xwnren2ySQjVzE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "versioneer" ];

  meta = {
    description = "Version-string management for VCS-controlled trees";
    homepage = "https://github.com/python-versioneer/python-versioneer";
    license = lib.licenses.publicDomain;
  };
})
