{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  boto3,
  moto,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "bucketstore";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jpetrucciani";
    repo = "bucketstore";
    tag = finalAttrs.version;
    hash = "sha256-WjweYFnlDEoR+TYzNgjPMdCLdUUEbdPROubov6kancc=";
  };

  build-system = [ poetry-core ];

  dependencies = [ boto3 ];

  nativeCheckInputs = [
    moto
    pytestCheckHook
  ];

  pythonImportsCheck = [ "bucketstore" ];

  meta = {
    description = "Library for interacting with Amazon S3";
    homepage = "https://github.com/jpetrucciani/bucketstore";
    license = lib.licenses.mit;
  };
})
