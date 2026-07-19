{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "korean_lunar_calendar";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6yxIUSSgYQFpJr3qbYnv35uf2/FttViVts8eW+wXuFc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "korean_lunar_calendar" ];

  meta = {
    description = "Library to convert Korean lunar-calendar to Gregorian calendar";
    homepage = "https://github.com/usingsky/korean_lunar_calendar_py";
    license = lib.licenses.mit;
  };
}
