{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "siphashc";
  version = "2.7";
  pyproject = true;
  build-system = [ setuptools ];

  src = fetchFromGitHub {
    owner = "WeblateOrg";
    repo = "siphashc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Rj+0oIlGs2Xs2TTN0PIwcVUlTgd1AZITC8xBf/Hn31Q=";
  };

  pythonImportsCheck = [ "siphashc" ];

  meta = {
    description = "Python c-module for siphash";
    homepage = "https://github.com/WeblateOrg/siphashc";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
})
