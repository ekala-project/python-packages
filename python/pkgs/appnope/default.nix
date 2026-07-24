{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "appnope";
  version = "0.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "minrk";
    repo = "appnope";
    tag = version;
    hash = "sha256-We7sZKVbQFIMdZpS+VMdi0RH1O/qtFNrfJNg/98tO5A=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "appnope" ];

  meta = {
    description = "Disable App Nap on macOS";
    homepage = "https://github.com/minrk/appnope";
    license = lib.licenses.bsd3;
  };
}
