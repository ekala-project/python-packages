{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools_80,
  setuptools-scm,
  makefun,
}:

buildPythonPackage (finalAttrs: {
  pname = "decopatch";
  version = "1.4.10";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lX9JyT9BUBgsI/j7UdE7syE+DxenngnIzKcFdZi1VyA=";
  };

  postPatch = ''
    substituteInPlace setup.cfg --replace-fail "pytest-runner" ""
  '';

  build-system = [
    setuptools_80 # setup.py imports pkg_resources
    setuptools-scm
  ];

  dependencies = [ makefun ];

  pythonImportsCheck = [ "decopatch" ];

  meta = {
    description = "Python helper for decorators";
    homepage = "https://github.com/smarie/python-decopatch";
    license = lib.licenses.bsd3;
  };
})
