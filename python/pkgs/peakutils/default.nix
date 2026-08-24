{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  scipy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "peakutils";
  version = "1.3.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T/Ln8zMLkwJP6Noe4E4AOJ4mvLLveb0vnPhszUli4RQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [ "peakutils" ];

  meta = {
    description = "Peak detection utilities for 1D data";
    homepage = "https://pypi.org/project/PeakUtils/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
