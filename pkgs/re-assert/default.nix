{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  regex,
}:

buildPythonPackage rec {
  pname = "re-assert";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "re_assert";
    inherit version;
    hash = "sha256-UXLfvSBHoV3/I0dzXep+SVR5zH5YhBGZpKSXMlayBGQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ regex ];

  pythonImportsCheck = [ "re_assert" ];

  doCheck = false;

  meta = {
    description = "Show where your regex match assertion failed";
    homepage = "https://github.com/asottile/re-assert";
    license = lib.licenses.mit;
  };
}
