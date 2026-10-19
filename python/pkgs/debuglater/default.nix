{
  lib,
  buildPythonPackage,
  colorama,
  dill,
  fetchFromGitHub,
  # build-system
  setuptools,
  numpy,
  pandas,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "debuglater";
  version = "1.4.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ploomber";
    repo = "debuglater";
    tag = finalAttrs.version;
    hash = "sha256-o9IAk3EN8ghEft7Y7Xx+sEjWMNgoyiZ0eiBqnCyXkm8=";
  };

  build-system = [ setuptools ];

  dependencies = [ colorama ];

  optional-dependencies = {
    all = [ dill ];
  };

  nativeCheckInputs = [
    numpy
    pandas
    pytestCheckHook
  ]
  ++ finalAttrs.optional-dependencies.all;

  pythonImportsCheck = [ "debuglater" ];

  meta = {
    description = "Module for post-mortem debugging of Python programs";
    homepage = "https://github.com/ploomber/debuglater";
    license = lib.licenses.mit;
  };
})
