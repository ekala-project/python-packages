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
  version = "4.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "XML-Security";
    repo = "signxml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0DzHw7E2sAJE3O7io++zjsi07FbkBD24EjGDOVo8/9s=";
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
