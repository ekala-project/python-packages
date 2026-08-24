{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  serpent,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyro5";
  version = "5.17";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "irmen";
    repo = "Pyro5";
    tag = "v${finalAttrs.version}";
    hash = "sha256-WVvUh/XPk+/1iRARAVD3fgmlJu60DZps7kRaZxuiwBo=";
  };

  build-system = [ setuptools ];

  dependencies = [ serpent ];

  pythonImportsCheck = [ "Pyro5" ];

  meta = {
    description = "Distributed object middleware for Python (RPC)";
    homepage = "https://github.com/irmen/Pyro5";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
