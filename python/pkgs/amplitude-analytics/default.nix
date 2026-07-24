{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "amplitude-analytics";
  version = "1.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amplitude";
    repo = "Amplitude-Python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-on4TJPiPyznYkBeJsTd7W59KhN7UaSX5+XJaSjkqFaE=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "amplitude" ];

  meta = {
    description = "Official Amplitude backend Python SDK for server-side instrumentation";
    homepage = "https://github.com/amplitude/Amplitude-Python";
    downloadPage = "https://github.com/amplitude/Amplitude-Python/releases";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
