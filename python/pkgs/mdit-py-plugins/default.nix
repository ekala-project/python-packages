{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  markdown-it-py,
}:

buildPythonPackage (finalAttrs: {
  pname = "mdit-py-plugins";
  version = "0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "executablebooks";
    repo = "mdit-py-plugins";
    tag = "v${finalAttrs.version}";
    hash = "sha256-rG9l45V+qsXZmBpRGkt1zuCRJVOsEC+Z2WrplQ1oGSo=";
  };

  build-system = [ flit-core ];

  dependencies = [ markdown-it-py ];

  pythonImportsCheck = [ "mdit_py_plugins" ];

  meta = {
    description = "Collection of core plugins for markdown-it-py";
    homepage = "https://github.com/executablebooks/mdit-py-plugins";
    license = lib.licenses.mit;
  };
})
