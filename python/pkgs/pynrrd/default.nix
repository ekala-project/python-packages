{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  numpy,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pynrrd";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mhe";
    repo = "pynrrd";
    tag = "v${version}";
    hash = "sha256-qu3s3XswJCUchqYfYMuqIzI4sfeXrttvXSEW9/GSENA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    typing-extensions
  ];

  pythonImportsCheck = [ "nrrd" ];

  meta = {
    homepage = "https://github.com/mhe/pynrrd";
    description = "Simple pure-Python reader for NRRD files";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
