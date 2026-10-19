{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "quantile-python";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VYYp6IxJfvO5sQgTScGuamG1NZDjF3JCmP9UxnTbeWk=";
  };

  build-system = [ setuptools ];

  # package has no tests

  pythonImportsCheck = [ "quantile" ];

  meta = {
    description = "Python Implementation of Graham Cormode and S. Muthukrishnan's Effective Computation of Biased Quantiles over Data Streams in ICDE'05";
    homepage = "https://github.com/matttproud/python_quantile_estimation";
    license = lib.licenses.asl20;
  };
}
