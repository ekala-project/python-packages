{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  prompt-toolkit,
}:

buildPythonPackage (finalAttrs: {
  pname = "clintermission";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebageek";
    repo = "clintermission";
    tag = "v${finalAttrs.version}";
    hash = "sha256-e7C9IDr+mhVSfU8lMywjX1BYwFo/qegPNzabak7UPcY=";
  };

  build-system = [ setuptools ];

  dependencies = [ prompt-toolkit ];

  # repo contains no tests

  pythonImportsCheck = [ "clintermission" ];

  meta = {
    description = "Non-fullscreen command-line selection menu";
    homepage = "https://github.com/sebageek/clintermission";
    license = lib.licenses.asl20;
  };
})
