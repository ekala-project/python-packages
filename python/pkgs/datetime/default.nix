{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pytz,
  zope_interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "DateTime";
  version = "6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "datetime";
    inherit (finalAttrs) version;
    hash = "sha256-wVFJNtL5AeEMjgjYO/BObJ29fKTyRNqU/smAmAo7xNU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 78.1.1,< 81" "setuptools"
  '';

  build-system = [ setuptools ];

  dependencies = [
    pytz
    zope_interface
  ];

  pythonImportsCheck = [ "DateTime" ];

  meta = {
    description = "DateTime data type, as known from Zope";
    homepage = "https://github.com/zopefoundation/DateTime";
    license = lib.licenses.zpl21;
  };
})
