{ lib
, buildPythonPackage
, pkgs
, # build-system
  setuptools
,
}:

buildPythonPackage {
  inherit (pkgs.numkong) pname version src;
  pyproject = true;

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "numkong" ];

  meta = {
    inherit (pkgs.numkong.meta)
      description
      homepage
      license
      ;
    maintainers = [ ];
  };
}
