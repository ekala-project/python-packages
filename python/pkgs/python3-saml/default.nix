{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  isodate,
  lxml,
  poetry-core,
  xmlsec,
}:

buildPythonPackage (finalAttrs: {
  pname = "python3-saml";
  version = "1.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "onelogin";
    repo = "python3-saml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KyDGmqhg/c29FaXPKK8rWKSBP6BOCpKKpOujCavXUcc=";
  };

  patches = [
    # Fix build system, https://github.com/SAML-Toolkits/python3-saml/pull/341
    (fetchpatch {
      name = "switch-to-poetry-core.patch";
      url = "https://github.com/SAML-Toolkits/python3-saml/commit/231a7e19543138fdd7424c01435dfe3f82bbe9ce.patch";
      hash = "sha256-MvX1LXhf3LJUy3O7L0/ySyVY4KDGc/GKJud4pOkwVIk=";
    })
  ];

  build-system = [ poetry-core ];

  dependencies = [
    isodate
    lxml
    xmlsec
  ];

  pythonImportsCheck = [ "onelogin.saml2" ];

  meta = {
    description = "OneLogin's SAML Python Toolkit";
    homepage = "https://github.com/onelogin/python3-saml";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
