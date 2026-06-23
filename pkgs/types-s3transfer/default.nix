{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types-s3transfer";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    pname = "types_s3transfer";
    inherit version;
    hash = "sha256-tGNkcgJMXitiJ4xbdZZh7+tSqBhRzeXwkvJBALHstEM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "s3transfer-stubs" ];

  meta = {
    description = "Type annotations and code completion for s3transfer";
    homepage = "https://github.com/youtype/types-s3transfer";
    license = lib.licenses.mit;
  };
}
