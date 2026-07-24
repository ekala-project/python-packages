{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cryptography,
  charset-normalizer,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pdfminer-six";
  version = "20260107";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pdfminer";
    repo = "pdfminer.six";
    tag = version;
    hash = "sha256-spWDwPoBLdySysYblCWABIWtokOMoJdpYQ6qxX94wIE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    charset-normalizer
    cryptography
  ];

  postInstall = ''
    for file in "$out/bin/"*.py; do
      mv "$file" "''${file%.py}"
    done
  '';

  pythonImportsCheck = [
    "pdfminer"
    "pdfminer.high_level"
  ];

  meta = {
    description = "PDF parser and analyzer";
    homepage = "https://github.com/pdfminer/pdfminer.six";
    license = lib.licenses.mit;
  };
}
