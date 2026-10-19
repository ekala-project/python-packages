{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyscrypt";
  version = "1.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1sd5pd5fpcdnpp4h58kdnvkf0s3afh4ssfqky2ap6z0gy6ax3zds";
  };

  build-system = [ setuptools ];

  meta = {
    homepage = "https://github.com/ricmoo/pyscrypt/";
    description = "Pure-Python implementation of Scrypt PBKDF and scrypt file format library";
    license = lib.licenses.mit;
  };
})
