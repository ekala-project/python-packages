{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatch-vcs,
  hatchling,
  # dependencies
  numpy,
  packaging,
  # tests
  awkward,
}:

buildPythonPackage (finalAttrs: {
  pname = "vector";
  version = "1.8.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "vector";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hHoJ8GFauswG5XCsQ4+pDbVPJvzuSz6eGx8ykUUegWk=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    numpy
    packaging
  ];

  pythonImportsCheck = [ "vector" ];

  meta = {
    description = "Library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way";
    homepage = "https://github.com/scikit-hep/vector";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
