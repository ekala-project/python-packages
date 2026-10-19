{
  buildPythonPackage,
  cffi,
  fetchPypi,
  # build-system
  setuptools,
  lib,
}:

buildPythonPackage rec {
  pname = "reflink";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iCN17nMZJ1rl9qahKHQGNl2sHpZDuRrRDlGH0/hCU70=";
  };

  build-system = [ setuptools ];

  dependencies = [ cffi ];

  propagatedNativeBuildInputs = [ cffi ];
  postPatch = ''
    substituteInPlace setup.py \
      --replace "pytest-runner" ""
  '';

  # FIXME: These do not work, and I have been unable to figure out why.

  pythonImportsCheck = [ "reflink" ];

  meta = {
    description = "Python reflink wraps around platform specific reflink implementations";
    homepage = "https://gitlab.com/rubdos/pyreflink";
    license = lib.licenses.mit;
  };
}
