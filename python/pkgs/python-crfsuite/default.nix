{
  lib,
  buildPythonPackage,
  fetchPypi,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-crfsuite";
  version = "0.9.12";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
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
  };
})
