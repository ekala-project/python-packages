{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "tcxreader";
  version = "0.4.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alenrajsp";
    repo = "tcxreader";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Iz0VQSukF5CI8lKaxKU4HEmU+n0EbQkuKmduOfsZ/GM=";
  };

  nativeBuildInputs = [ poetry-core ];

  pythonImportsCheck = [ "tcxreader" ];

  meta = {
    description = "Reader for Garmin’s TCX file format";
    homepage = "https://github.com/alenrajsp/tcxreader";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
