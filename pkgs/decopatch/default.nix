{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  makefun,
}:

buildPythonPackage rec {
  pname = "decopatch";
  version = "1.4.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lX9JyT9BUBgsI/j7UdE7syE+DxenngnIzKcFdZi1VyA=";
  };

  postPatch = ''
    substituteInPlace setup.cfg --replace-fail "pytest-runner" ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ makefun ];

  pythonImportsCheck = [ "decopatch" ];

  meta = {
    description = "Python helper for decorators";
    homepage = "https://github.com/smarie/python-decopatch";
    license = lib.licenses.bsd3;
  };
}
