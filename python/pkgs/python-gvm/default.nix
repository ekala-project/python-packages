{
  lib,
  buildPythonPackage,
  defusedxml,
  fetchFromGitHub,
  lxml,
  paramiko,
  poetry-core,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-gvm";
  version = "26.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greenbone";
    repo = "python-gvm";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NTUDFZnDavHhl5AELMNj8AkwwVtY+96cMB9uhm4veQg=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [ "defusedxml" ];

  dependencies = [
    defusedxml
    lxml
    paramiko
    typing-extensions
  ];

  pythonImportsCheck = [ "gvm" ];

  meta = {
    description = "Collection of APIs that help with remote controlling a Greenbone Security Manager";
    homepage = "https://github.com/greenbone/python-gvm";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
  };
})
