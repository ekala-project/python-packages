{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mujson";
  version = "1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-J9nPGxDkLQje6AkL9cewNqmQ7Z+00TXBEr3p71E2cnE=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace "license_file = LICENSE" ""
  '';

  pythonImportsCheck = [ "mujson" ];

  meta = {
    description = "Use the fastest JSON functions available at import time";
    homepage = "https://github.com/mattgiles/mujson";
    license = lib.licenses.mit;
  };
}
