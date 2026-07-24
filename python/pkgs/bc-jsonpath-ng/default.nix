{
  lib,
  buildPythonPackage,
  decorator,
  fetchFromGitHub,
  ply,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "bc-jsonpath-ng";
  version = "1.6.1";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "bridgecrewio";
    repo = "jsonpath-ng";
    tag = finalAttrs.version;
    hash = "sha256-FWP4tzlacAWVXG3YnPwl5MKc12geaCxZ2xyKx9PSarU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    decorator
    ply
  ];
  pythonImportsCheck = [ "bc_jsonpath_ng" ];

  meta = {
    description = "JSONPath implementation for Python";
    mainProgram = "bc_jsonpath_ng";
    homepage = "https://github.com/bridgecrewio/jsonpath-ng";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
