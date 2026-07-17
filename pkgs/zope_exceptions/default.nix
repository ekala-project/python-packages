{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope-interface,
}:

buildPythonPackage rec {
  pname = "zope.exceptions";
  version = "6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_exceptions";
    inherit version;
    hash = "sha256-CsDgeOzdistdojHDn8ZFS98ySSFv0cBtBXi/jqa/Mpk=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [ zope-interface ];

  pythonImportsCheck = [ "zope.exceptions" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope exceptions";
    homepage = "https://github.com/zopefoundation/zope.exceptions";
    license = lib.licenses.zpl21;
  };
}
