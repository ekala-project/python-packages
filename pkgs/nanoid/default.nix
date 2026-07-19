{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "nanoid";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WoDK1enG6a46Qfovs0rhiffLQgsqXY+CvZ0jRm5O+mg=";
  };

  build-system = [ setuptools ];

  doCheck = false; # tests not in sdist, git not tagged

  pythonImportsCheck = [ "nanoid" ];

  meta = {
    description = "Tiny, secure, URL-friendly, unique string ID generator for Python";
    homepage = "https://github.com/puyuan/py-nanoid";
    license = lib.licenses.mit;
  };
}
