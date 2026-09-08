{
  lib,
  buildPythonPackage,
  certifi,
  cryptography,
  fetchFromGitHub,
  lxml,
  pyopenssl,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "signxml";
  version = "5.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "XML-Security";
    repo = "signxml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SvM+wqlJd2n3gg1ROzWTuUvwSlOrMQIPDO39IyVNrRA=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    certifi
    cryptography
    lxml
    pyopenssl
  ];
  pythonImportsCheck = [ "signxml" ];
  meta = {
    description = "Python XML Signature and XAdES library";
    homepage = "https://github.com/XML-Security/signxml";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
