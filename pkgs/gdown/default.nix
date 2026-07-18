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

buildPythonPackage rec {
  pname = "gdown";
  version = "6.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NhxuBMbKM131C51x9AvP6atw+yahsOiQpCcmd4E4lVM=";
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
}
