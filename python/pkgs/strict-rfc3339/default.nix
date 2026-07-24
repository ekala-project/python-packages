{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "strict-rfc3339";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XK0Xvt/Dr1ezmdsP7TJ3Hxj8VLvZF+hVRgiGB6xeEnc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "strict_rfc3339" ];

  meta = {
    description = "Strict, simple, lightweight RFC3339 functions";
    homepage = "https://github.com/danielrichman/strict-rfc3339";
    license = lib.licenses.gpl3;
  };
}
