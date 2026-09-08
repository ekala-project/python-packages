{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  beautifulsoup4,
}:

buildPythonPackage rec {
  pname = "micawber";
  version = "0.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3u2qkRfFbH2AAwrFVm/cW1Kz62qfryuqaUCIltkJDSg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
  ];

  pythonImportsCheck = [ "micawber" ];

  meta = {
    description = "Module for extracting rich content from URLs";
    homepage = "https://micawber.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };
}
