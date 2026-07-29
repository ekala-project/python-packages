{
  aiofiles,
  buildPythonPackage,
  fetchFromGitHub,
  httpcore,
  httpx,
  lib,
  pydantic,
  pypdf,
  pypdfium2,
  python,
  requests-toolbelt,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "unstructured-client";
  version = "0.45.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Unstructured-IO";
    repo = "unstructured-python-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-K4+k1wKFvT2JYElt2SdBFKJGpFdC15Bu8Aa+M/c7JSQ=";
  };

  preBuild = ''
    ${python.interpreter} scripts/prepare_readme.py
  '';

  build-system = [ setuptools ];

  dependencies = [
    aiofiles
    httpcore
    httpx
    pydantic
    pypdf
    pypdfium2
    requests-toolbelt
  ];

  pythonImportsCheck = [ "unstructured_client" ];
  # see test-unit in Makefile
  enabledTests = [
    "unit"
  ];

  meta = {
    description = "Python Client SDK for Unstructured API";
    homepage = "https://github.com/Unstructured-IO/unstructured-python-client";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
