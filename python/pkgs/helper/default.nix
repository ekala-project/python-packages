{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pyyaml,
  pytestCheckHook,
  mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "helper";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gmr";
    repo = "helper";
    tag = finalAttrs.version;
    sha256 = "0zypjv8rncvrsgl200v7d3bn08gs48dwqvgamfqv71h07cj6zngp";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  nativeCheckInputs = [
    pytestCheckHook
    mock
  ];

  pythonImportsCheck = [
    "helper"
    "helper.config"
  ];

  meta = {
    description = "Development library for quickly writing configurable applications and daemons";
    homepage = "https://helper.readthedocs.org/";
    license = lib.licenses.bsd3;
  };
})
