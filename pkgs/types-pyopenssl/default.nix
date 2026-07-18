{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cryptography,
  types-cffi,
}:

buildPythonPackage rec {
  pname = "types-pyOpenSSL";
  version = "24.1.0.20240722";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-R5E7RnigHYefUDoSBERoIh7YV2JjwVQNywSEyiGwjDk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    types-cffi
  ];

  meta = {
    description = "Typing stubs for pyopenssl";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
