{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "umalqurra";
  version = "0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cZ9qNvkIraHCna4Nk03Q8eH24zBXhO2+wjrXGTl95ng=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "umalqurra" ];

  meta = {
    description = "Date Api that support Hijri Umalqurra calendar";
    homepage = "https://github.com/tytkal/python-hijiri-ummalqura";
    license = lib.licenses.publicDomain;
  };
}
