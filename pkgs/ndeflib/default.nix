{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ndeflib";
  version = "0.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nfcpy";
    repo = "ndeflib";
    tag = "v${version}";
    hash = "sha256-cpfztE+/AW7P0J7QeTDfVGYc2gEkr7gzA352hC9bdTM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ndef" ];

  meta = {
    description = "Python package for parsing and generating NFC Data Exchange Format messages";
    homepage = "https://github.com/nfcpy/ndeflib";
    changelog = "https://github.com/nfcpy/ndeflib/releases/tag/v${version}";
    license = lib.licenses.isc;
  };
}
