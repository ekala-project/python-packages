{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pdm-backend,
  uv-dynamic-versioning,
}:

buildPythonPackage (finalAttrs: {
  pname = "griffelib";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "griffe";
    tag = finalAttrs.version;
    hash = "sha256-hNKL86LSE9PwIofxt2t5PrlThiX7hTgYADK2HDVhNjk=";
  };

  sourceRoot = "${finalAttrs.src.name}/packages/griffelib";

  build-system = [
    hatchling
    pdm-backend
    uv-dynamic-versioning
  ];

  pythonImportsCheck = [ "griffe" ];

  meta = {
    description = "Signatures for entire Python programs";
    homepage = "https://github.com/mkdocstrings/griffe";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
})
