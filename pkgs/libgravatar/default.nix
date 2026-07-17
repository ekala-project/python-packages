{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "libgravatar";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pabluk";
    repo = "libgravatar";
    tag = version;
    hash = "sha256-rJv/jfdT+JldxR0kKtXQLOI5wXQYSQRWJnqwExwWjTA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "libgravatar" ];

  meta = {
    description = "Library that provides a Python 3 interface for the Gravatar API";
    homepage = "https://github.com/pabluk/libgravatar";
    license = lib.licenses.gpl3Plus;
  };
}
