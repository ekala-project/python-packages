{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "colorlog";
  version = "6.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "borntyping";
    repo = "python-colorlog";
    tag = "v${version}";
    hash = "sha256-K7gxWg1OMSwcslrBvEyRIoGKSDOrlfiLmhxl8PbL/9g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "colorlog" ];

  meta = {
    description = "Log formatting with colors";
    homepage = "https://github.com/borntyping/python-colorlog";
    license = lib.licenses.mit;
  };
}
