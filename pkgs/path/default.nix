{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "path";
  version = "17.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Lfy/7ItNlg80acUqzxMxE8KovxKse5jWKfqRr4ckjUI=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "path" ];

  meta = {
    description = "Object-oriented file system path manipulation";
    homepage = "https://github.com/jaraco/path";
    license = lib.licenses.mit;
  };
}
