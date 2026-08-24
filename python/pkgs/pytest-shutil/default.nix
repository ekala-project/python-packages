{ lib
, buildPythonPackage
, pytest-fixture-config
, # build-time
  setuptools
, # runtime
  pytest
, execnet
, termcolor
, six
,
}:

buildPythonPackage {
  pname = "pytest-shutil";
  inherit (pytest-fixture-config) version src patches;
  pyproject = true;

  postPatch = ''
    cd pytest-shutil
  '';

  build-system = [
    setuptools
  ];

  buildInputs = [ pytest ];

  dependencies = [
    execnet
    termcolor
    six
  ];

  meta = {
    description = "Goodie-bag of unix shell and environment tools for py.test";
    homepage = "https://github.com/manahl/pytest-plugins";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
