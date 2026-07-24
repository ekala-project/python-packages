{
  lib,
  buildPythonPackage,
  fetchPypi,
  cython,
}:

buildPythonPackage rec {
  pname = "python-crfsuite";
  version = "0.9.12";
  format = "setuptools";

  src = fetchPypi {
    inherit version;
    pname = "python_crfsuite";
    hash = "sha256-2zf8zDvY8MScKKdpfKecidZ7P9W/EZEihmFpJArExIA=";
  };
  build-system = [
    cython
  ];
  pythonImportsCheck = [ "pycrfsuite" ];

  meta = {
    description = "Python binding for CRFsuite";
    homepage = "https://github.com/scrapinghub/python-crfsuite";
    license = lib.licenses.mit;
    teams = [ lib.teams.tts ];
  };
}
