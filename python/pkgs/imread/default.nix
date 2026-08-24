{ buildPythonPackage
, fetchPypi
, pkg-config
, setuptools
, libjpeg
, libpng
, libtiff
, libwebp
, numpy
,
}:

buildPythonPackage rec {
  pname = "imread";
  version = "0.7.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ULPXCJyGJQTCKyVu9R/kWFGzRhbbFMDr/FU2AByZYBU=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    libjpeg
    libpng
    libtiff
    libwebp
  ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "imread" ];

}
