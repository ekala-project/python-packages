{ lib
, buildPythonPackage
, fetchPypi
, # build-system
  setuptools
,
}:

buildPythonPackage rec {
  pname = "myhdl";
  version = "0.11.51";
  pyproject = true;

  # No recent tags on GitHub
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nZEdYLRjk2rgS3byc4iu9oJazodnoNg63MBUMasGZiw=";
  };

  build-system = [
    setuptools
  ];

  meta = {
    description = "Free, open-source package for using Python as a hardware description and verification language";
    homepage = "https://www.myhdl.org/";
    license = lib.licenses.lgpl21;
    maintainers = [ ];
  };
}
