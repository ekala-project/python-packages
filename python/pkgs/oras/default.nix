{ lib
, buildPythonPackage
, fetchFromGitHub
, jsonschema
, requests
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "oras";
  version = "0.2.42";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oras-project";
    repo = "oras-py";
    tag = finalAttrs.version;
    hash = "sha256-fuDvhz7dTsPM1AZkPUUgalXUnslAKqTXplslbOUjS/I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    jsonschema
    requests
  ];

  pythonImportsCheck = [ "oras" ];

  meta = {
    description = "ORAS Python SDK";
    homepage = "https://github.com/oras-project/oras-py";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
