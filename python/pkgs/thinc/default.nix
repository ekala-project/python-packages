{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  blis,
  cymem,
  cython,
  murmurhash,
  numpy,
  preshed,
  setuptools,

  # buildInputs
  blas,

  # dependencies
  catalogue,
  confection,
  pydantic,
  srsly,
  wasabi,
}:

buildPythonPackage (finalAttrs: {
  pname = "thinc";
  version = "8.3.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "thinc";
    tag = "release-v${finalAttrs.version}";
    hash = "sha256-8nf+AWAD7Fy50XRJDINmyk42F7KMDhGgATwqbln3r04=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail coverage.exceptions.CoverageWarning ""
  '';

  build-system = [
    blis
    cymem
    cython
    murmurhash
    numpy
    preshed
    setuptools
  ];

  buildInputs = [
    blas
  ];

  dependencies = [
    blis
    catalogue
    confection
    cymem
    murmurhash
    numpy
    preshed
    pydantic
    srsly
    wasabi
  ];

  pythonImportsCheck = [ "thinc" ];
  # avoid local paths, relative imports wont resolve correctly
  meta = {
    description = "Library for NLP machine learning";
    homepage = "https://github.com/explosion/thinc";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
