{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pika,
}:

buildPythonPackage rec {
  pname = "pika-pool";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-85hYiMwniM29KTpoqLVwKpyVXbb3uLVRrqyR5/Mto5c=";
  };

  build-system = [ setuptools ];

  dependencies = [ pika ];

  pythonImportsCheck = [ "pika_pool" ];

  pythonRelaxDeps = true;

  meta = {
    description = "Pools for pikas";
    homepage = "https://github.com/bninja/pika-pool";
    license = lib.licenses.bsdOriginal;
  };
}
