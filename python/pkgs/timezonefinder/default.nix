{
  lib,
  buildPythonPackage,
  cffi,
  fetchFromGitHub,
  flatbuffers,
  h3,
  numba,
  numpy,
  pytz,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "timezonefinder";
  version = "8.2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jannikmi";
    repo = "timezonefinder";
    tag = finalAttrs.version;
    hash = "sha256-NDxGYiBYFqYU3tK/RwlHYARcncAB1GJk+qHxRNrT1oU=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cffi ];

  dependencies = [
    cffi
    flatbuffers
    h3
    numpy
  ];

  optional-dependencies = {
    numba = [ numba ];
    pytz = [ pytz ];
  };
  meta = {
    description = "Module for finding the timezone of any point on earth (coordinates) offline";
    homepage = "https://github.com/MrMinimal64/timezonefinder";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "timezonefinder";
  };
})
