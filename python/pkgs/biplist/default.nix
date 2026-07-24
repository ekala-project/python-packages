{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "biplist";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TAVJdkxf5QsoBC7CGqLhT+GiIk4jmh2ud9nn85MqpMY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "biplist" ];

  meta = {
    description = "Binary plist parser/generator for Python";
    homepage = "https://bitbucket.org/wooster/biplist/src/master/";
    license = lib.licenses.bsd3;
  };
}
