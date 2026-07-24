{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pysmt";
  version = "0.9.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pysmt";
    repo = "pysmt";
    rev = "v${version}";
    hash = "sha256-HmEdCJOF04h0z5UPpfYa07b78EEBj5KyVAk6aNRFPEo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pysmt" ];

  meta = {
    description = "Python library for SMT formulae manipulation and solving";
    mainProgram = "pysmt-install";
    homepage = "https://github.com/pysmt/pysmt";
    license = lib.licenses.asl20;
  };
}
