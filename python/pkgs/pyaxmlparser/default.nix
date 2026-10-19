{
  buildPythonPackage,
  lib,
  lxml,
  click,
  fetchFromGitHub,
  # build-system
  setuptools,
  asn1crypto,
}:

buildPythonPackage (finalAttrs: {
  version = "0.3.31";
  pyproject = true;
  pname = "pyaxmlparser";

  src = fetchFromGitHub {
    owner = "appknox";
    repo = "pyaxmlparser";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ZV2PyWQfK9xidzGUz7XPAReaVjlB8tMUKQiXoGcFCGs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asn1crypto
    click
    lxml
  ];

  meta = {
    description = "Python3 Parser for Android XML file and get Application Name without using Androguard";
    mainProgram = "apkinfo";
    homepage = "https://github.com/appknox/pyaxmlparser";
    # Files from Androguard are licensed ASL 2.0
    license = with lib.licenses; [
      mit
      asl20
    ];
  };
})
