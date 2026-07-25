{
  lib,
  bottleneck,
  buildPythonPackage,
  fetchPypi,
  jellyfish,
  joblib,
  networkx,
  numexpr,
  numpy,
  pandas,
  pyarrow,
  scikit-learn,
  scipy,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage rec {
  pname = "recordlinkage";
  version = "0.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7NoMEN/xOLFwaBXeMysShfZwrn6MzpJZYhNQHVieaqQ=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    pyarrow
    jellyfish
    numpy
    pandas
    scipy
    scikit-learn
    joblib
    networkx
    bottleneck
    numexpr
  ];

  # pytestCheckHook does not work
  # Reusing their CI setup which involves 'rm -rf recordlinkage' in preCheck phase do not work too.
  pythonImportsCheck = [ "recordlinkage" ];

  meta = {
    description = "Library to link records in or between data sources";
    homepage = "https://recordlinkage.readthedocs.io/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
