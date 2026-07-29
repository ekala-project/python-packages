{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "omitempty";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bfontaine";
    repo = "omitempty";
    tag = finalAttrs.version;
    hash = "sha256-XQ887ArfxXnPJcCksgS5Zkg9VAfGRxu0wapewsnqdpY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "omitempty" ];

  # Tests are outdated
  doCheck = false;

  meta = {
    description = "Go's omitempty for Python";
    homepage = "https://github.com/bfontaine/omitempty";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
