{
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
  fs,
  six,
  boto3,
}:

buildPythonPackage (finalAttrs: {
  pname = "fs-s3fs";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "b57f8c7664460ff7b451b4b44ca2ea9623a374d74e1284c2d5e6df499dc7976c";
  };

  build-system = [ setuptools ];

  dependencies = [
    fs
    six
    boto3
  ];

  # tests try to integrate an s3 bucket which can't be tested properly in an isolated environment.

  meta = {
    homepage = "https://pypi.org/project/fs-s3fs/";
    license = lib.licenses.mit;
    description = "Amazon S3 filesystem for PyFilesystem2";
  };
})
