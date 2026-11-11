{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "flatbuffers";
  version = "25.12.19";
  pyproject = true;

  # PyPI only ships a wheel for this release
  src = fetchFromGitHub {
    owner = "google";
    repo = "flatbuffers";
    tag = "v${finalAttrs.version}";
    hash = "sha256-I4PthsQOOV8tsi5uRYudyqBPcbE+ZH8Q9j0Ms4HP9Ec=";
  };

  sourceRoot = "${finalAttrs.src.name}/python";

  build-system = [ setuptools ];

  pythonImportsCheck = [ "flatbuffers" ];

  meta = {
    description = "Python runtime library for use with the Flatbuffers serialization format";
    homepage = "https://google.github.io/flatbuffers/";
    license = lib.licenses.asl20;
  };
})
