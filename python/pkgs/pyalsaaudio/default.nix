{ alsa-lib
, buildPythonPackage
, fetchPypi
, lib
,
}:

buildPythonPackage rec {
  pname = "pyalsaaudio";
  version = "0.11.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-p4qdyjNSSyyQZLNOIfWrh0JyMTzzJKmndZLzlqXg/dw=";
  };

  buildInputs = [
    alsa-lib
  ];

  pythonImportsCheck = [ "alsaaudio" ];

  meta = {
    description = "ALSA wrappers for Python";
    homepage = "https://github.com/larsimmisch/pyalsaaudio";
    license = lib.licenses.psfl;
    maintainers = [ ];
  };
}
