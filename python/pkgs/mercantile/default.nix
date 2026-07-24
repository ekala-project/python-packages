{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  click,

  # tests
  hypothesis,
}:

buildPythonPackage rec {
  pname = "mercantile";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mapbox";
    repo = "mercantile";
    tag = version;
    hash = "sha256-DiDXO2XnD3We6NhP81z7aIHzHrHDi/nkqy98OT9986w=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    click
  ];
  meta = {
    description = "Spherical mercator tile and coordinate utilities";
    mainProgram = "mercantile";
    homepage = "https://github.com/mapbox/mercantile";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
