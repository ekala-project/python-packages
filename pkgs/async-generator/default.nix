{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "async-generator";
  version = "1.10";
  pyproject = true;

  src = fetchPypi {
    pname = "async_generator";
    inherit version;
    hash = "sha256-brs9EGwSkgqq5CzLb3h+9e79zdFm6j1ij6hHar5xIUQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "async_generator" ];

  meta = {
    description = "Async generators and context managers for Python 3.5+";
    homepage = "https://github.com/python-trio/async_generator";
    license = with lib.licenses; [
      mit
      asl20
    ];
  };
}
