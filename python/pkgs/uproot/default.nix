{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  hatch-vcs
, hatchling
, # dependencies
  awkward
, cramjam
, fsspec
, numpy
, packaging
, # tests
  xxhash
,
}:

buildPythonPackage (finalAttrs: {
  pname = "uproot";
  version = "5.7.5";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "uproot5";
    tag = "v${finalAttrs.version}";
    hash = "sha256-McTYYA0A8P7Z7PxuTBg5upcOnMmBsfk64fHASMWegOs=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    awkward
    cramjam
    fsspec
    numpy
    packaging
    xxhash
  ];

  pythonImportsCheck = [ "uproot" ];

  meta = {
    description = "ROOT I/O in pure Python and Numpy";
    homepage = "https://github.com/scikit-hep/uproot5";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
