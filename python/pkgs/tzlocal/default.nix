{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tzlocal";
  version = "5.4.5";

  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-updomLrSeUUXjJyiXCIsGeMiswwQNCufQLRnFPcNLV8=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "tzlocal" ];

  meta = {
    description = "Tzinfo object for the local timezone";
    homepage = "https://github.com/regebro/tzlocal";
    license = lib.licenses.mit;
  };
})
