{ lib
, attrs
, buildPythonPackage
, distro
, fetchFromGitHub
, jsonschema
, setuptools
, zipfile2
,
}:

buildPythonPackage rec {
  pname = "okonomiyaki";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "enthought";
    repo = "okonomiyaki";
    tag = version;
    hash = "sha256-xAF9Tdr+IM3lU+mcNcAWATJLZOVvbx0llqznqHLVqDc=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    all = [
      attrs
      distro
      jsonschema
      zipfile2
    ];
    platforms = [
      attrs
      distro
    ];
    formats = [
      attrs
      distro
      jsonschema
      zipfile2
    ];
  };

  pythonImportsCheck = [ "okonomiyaki" ];

  meta = {
    description = "Experimental library aimed at consolidating a lot of low-level code used for Enthought's eggs";
    homepage = "https://github.com/enthought/okonomiyaki";
    maintainers = [ ];
    license = lib.licenses.bsd3;
  };
}
