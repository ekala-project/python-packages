{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "configupdater";
  version = "4.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "configupdater";
    inherit (finalAttrs) version;
    hash = "sha256-XlY4P9BTZ/QgSp1GvyCxu7iLRSV8uTOTj/b4e8FwV+c=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "configupdater" ];

  meta = {
    description = "Parser like ConfigParser but for updating configuration files";
    homepage = "https://configupdater.readthedocs.io/en/latest/";
    license = with lib.licenses; [
      mit
      psfl
    ];
  };
})
