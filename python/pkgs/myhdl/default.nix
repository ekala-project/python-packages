{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "myhdl";
  version = "0.11.52";
  pyproject = true;

  # No recent tags on GitHub
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gUz3hyyBan+4q+ltmLJDuBXanomAVt/bvbaAY9ruZJY=";
  };

  build-system = [
    setuptools
  ];

  meta = {
    description = "Free, open-source package for using Python as a hardware description and verification language";
    homepage = "https://www.myhdl.org/";
    license = lib.licenses.lgpl21;
  };
})
