{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "makefun";
  version = "1.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4UYBgxVwv/H21+aIKLzTDS9YVvJLrV3gzLIpIc7ryUc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools>=39.2,<72"' '"setuptools"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "makefun" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/smarie/python-makefun";
    description = "Small library to dynamically create python functions";
    license = lib.licenses.bsd2;
  };
}
