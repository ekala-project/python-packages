{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx,
  lxml,
  paramiko,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-gvm";
  version = "27.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greenbone";
    repo = "python-gvm";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nyIaX9L9vdFZuoL8I77JroyWJNvLDIsFj4TRmUppUSs=";
  };

  build-system = [ hatchling ];

  dependencies = [
    httpx
    lxml
    paramiko
  ];

  pythonImportsCheck = [ "gvm" ];

  meta = {
    description = "Collection of APIs that help with remote controlling a Greenbone Security Manager";
    homepage = "https://github.com/greenbone/python-gvm";
    license = lib.licenses.gpl3Plus;
  };
})
