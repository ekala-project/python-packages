{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  numpy,
  scipy,
  pytest,
  python,
  pybind11,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pyamg";
  version = "5.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UyPQ8aTNmZviRqkNWAyeHptYS5iIf2KY05dhEIfvhgs=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail \
        'setuptools_scm[toml]==8.3.0' \
        'setuptools_scm>=8.3.0' \
  '';

  nativeBuildInputs = [ setuptools-scm ];

  propagatedBuildInputs = [
    numpy
    scipy
    pytest
    pybind11
  ];

  pythonImportsCheck = [
    "pyamg"
    "pyamg.amg_core.evolution_strength"
  ];

  meta = {
    description = "Algebraic Multigrid Solvers in Python";
    homepage = "https://github.com/pyamg/pyamg";
    license = lib.licenses.mit;
    maintainers = [ ];
    broken = stdenv.hostPlatform.isDarwin && lib.versionAtLeast python.version "3.14";
  };
}
