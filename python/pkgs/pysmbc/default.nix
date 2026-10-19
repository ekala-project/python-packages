{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pkg-config,
}:

buildPythonPackage rec {
  pname = "pysmbc";
  version = "1.0.25.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IvFxXfglif2cxCU/6rOQtO8Lq/FPZFE82NB7N4mWMiY=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];

  pythonImportsCheck = [ "smbc" ];

  meta = {
    description = "Libsmbclient binding for Python";
    homepage = "https://github.com/hamano/pysmbc";
    license = lib.licenses.gpl2Plus;
  };
}
