{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytlv";
  version = "0.71";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-btxZ0oQzn1ZpwXihHlg6CduLh8nkerLV7SoFyXzJjVY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pytlv" ];

  meta = {
    description = "TLV data parser, especially useful for EMV tags parsing";
    homepage = "https://github.com/timgabets/pytlv";
    license = lib.licenses.lgpl2;
  };
})
