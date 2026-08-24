{ lib
, buildPythonPackage
, fetchFromGitHub
, # nativeBuildInputs
  cmake
, # build-system
  pybind11
, nanobind
, ninja
, scikit-build-core
, setuptools-scm
, # buildInputs
  boost
, # dependencies
  numpy
,
}:

buildPythonPackage (finalAttrs: {
  pname = "boost-histogram";
  version = "1.7.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "boost-histogram";
    tag = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-nDNSLpmQ3YOo/nEkHfvsE0l9yATzQnrlunX1qWupbLQ=";
  };

  nativeBuildInputs = [ cmake ];

  dontUseCmakeConfigure = true;

  build-system = [
    pybind11
    nanobind
    ninja
    scikit-build-core
    setuptools-scm
  ];

  buildInputs = [ boost ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "boost_histogram" ];

  meta = {
    description = "Python bindings for the C++14 Boost::Histogram library";
    homepage = "https://github.com/scikit-hep/boost-histogram";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
