{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "astroid";
  version = "4.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "astroid";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lFR9F/+RIQux40mT8pvfUnE5SNe7kVHI//5JuDYMuk4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "astroid" ];

  meta = {
    description = "Abstract syntax tree for Python with inference support";
    homepage = "https://github.com/PyCQA/astroid";
    license = lib.licenses.lgpl21Plus;
  };
})
