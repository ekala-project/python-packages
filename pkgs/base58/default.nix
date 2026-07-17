{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "base58";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xdDLP1tugejjXaV1Q4jdzG0NFLbGoTLLk9ae1YCnJ4w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "base58" ];

  meta = {
    description = "Base58 and Base58Check implementation";
    homepage = "https://github.com/keis/base58";
    license = lib.licenses.mit;
  };
}
