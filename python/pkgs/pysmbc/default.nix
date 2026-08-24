{ lib
, buildPythonPackage
, fetchPypi
, samba
, pkg-config
,
}:

buildPythonPackage rec {
  pname = "pysmbc";
  version = "1.0.25.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IvFxXfglif2cxCU/6rOQtO8Lq/FPZFE82NB7N4mWMiY=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ samba ];

  pythonImportsCheck = [ "smbc" ];

  meta = {
    description = "Libsmbclient binding for Python";
    homepage = "https://github.com/hamano/pysmbc";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}
