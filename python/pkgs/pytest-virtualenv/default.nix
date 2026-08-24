{ lib
, buildPythonPackage
, importlib-metadata
, pytest
, pytest-fixture-config
, pytest-shutil
, setuptools
, virtualenv
,
}:

buildPythonPackage {
  pname = "pytest-virtualenv";
  inherit (pytest-fixture-config) version src patches;
  pyproject = true;

  postPatch = ''
    cd pytest-virtualenv
  '';

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [
    importlib-metadata
    pytest-fixture-config
    pytest-shutil
    virtualenv
  ];

  # Don't run integration tests

  meta = {
    description = "Create a Python virtual environment in your test that cleans up on teardown. The fixture has utility methods to install packages and list what’s installed";
    homepage = "https://github.com/manahl/pytest-plugins";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
