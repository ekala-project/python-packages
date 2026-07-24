{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "pathlib2";
  version = "2.3.7.post1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-n+DtrYmLg8DD4ZnIQrJ+0hZkXS4Xd1ey3Wc4TUETxkE=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "pathlib2" ];

  meta = {
    description = "Filesystem paths with semantics for different operating systems";
    homepage = "https://pypi.org/project/pathlib2/";
    license = lib.licenses.mit;
  };
}
