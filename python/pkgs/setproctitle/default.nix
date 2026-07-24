{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "setproctitle";
  version = "1.3.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dvarrazzo";
    repo = "py-setproctitle";
    tag = "version-${version}";
    hash = "sha256-dfOdtfOXRAoCQLW307+YMsFIWRv4CupbKUxckev1oUw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "setproctitle" ];

  meta = {
    description = "Allows a process to change its title (as displayed by system tools such as ps and top)";
    homepage = "https://github.com/dvarrazzo/py-setproctitle";
    license = lib.licenses.bsd3;
  };
}
