{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "netifaces";
  version = "0.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-BDp5FG6ykH7fQ5iZ8mKz3+QXF9NBJCmO0oETmouTyjI=";
  };

  build-system = [ setuptools ];

  # No tests implemented

  pythonImportsCheck = [ "netifaces" ];

  meta = {
    description = "Portable access to network interfaces from Python";
    homepage = "https://github.com/al45tair/netifaces";
    license = lib.licenses.mit;
  };
})
