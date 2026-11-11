{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,

  # dependencies
  beautifulsoup4,
  filelock,
  requests,
  setuptools,
  tqdm,
}:

buildPythonPackage (finalAttrs: {
  pname = "gdown";
  version = "6.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-5EG1ZFibT59JhVZ5ZJs7BLDS4Fa8HWNWkffgA8on5dA=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  dependencies = [
    beautifulsoup4
    filelock
    requests
    setuptools
    tqdm
  ];

  pythonImportsCheck = [ "gdown" ];

  meta = {
    description = "CLI tool for downloading large files from Google Drive";
    homepage = "https://github.com/wkentaro/gdown";
    license = lib.licenses.mit;
  };
})
