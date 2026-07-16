{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "waitress";
  version = "3.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aCqq8q8MRK2kq/tw3tNjk/DjB/SrlFaiFc4AILrvwx8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "waitress" ];

  meta = {
    homepage = "https://github.com/Pylons/waitress";
    description = "Waitress WSGI server";
    mainProgram = "waitress-serve";
    license = lib.licenses.zpl21;
  };
}
