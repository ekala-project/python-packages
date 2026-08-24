{ buildPythonPackage
, fetchFromGitHub
, # needed to build
  cython
, extension-helpers
, oldest-supported-numpy
, setuptools
, setuptools-scm
, # needed to run
  astropy
, numpy
, pyparsing
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyregion";
  version = "2.3.0";
  pyproject = true;

  # pypi src contains cython-produced .c files which don't compile
  # with python3.9
  src = fetchFromGitHub {
    owner = "astropy";
    repo = "pyregion";
    tag = "v${finalAttrs.version}";
    hash = "sha256-mEO2PbUSTVy7Qmm723/lGL6PYQzbRazIPZH51SWebvs=";
  };

  dependencies = [
    astropy
    numpy
    pyparsing
  ];

  build-system = [
    cython
    extension-helpers
    oldest-supported-numpy
    setuptools
    setuptools-scm
  ];

})
