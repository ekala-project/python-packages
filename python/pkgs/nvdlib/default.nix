{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  requests,
  responses,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "nvdlib";
  version = "0.8.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Vehemont";
    repo = "nvdlib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FjeYJMMccao9KJMcJBKtt5QhpQEEbcPyNunj+VqMdx0=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ requests ];

  nativeCheckInputs = [
    pytestCheckHook
    responses
  ];

  pythonImportsCheck = [ "nvdlib" ];

  meta = {
    description = "Module to interact with the National Vulnerability CVE/CPE API";
    homepage = "https://github.com/Vehemont/nvdlib/";
    license = lib.licenses.mit;
  };
})
