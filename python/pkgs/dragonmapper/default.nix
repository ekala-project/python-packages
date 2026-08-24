{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hanzidentifier,
  zhon,
}:

buildPythonPackage rec {
  pname = "dragonmapper";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tsroten";
    repo = "dragonmapper";
    tag = "v${version}";
    hash = "sha256-3SRSu/9cpg2YcEuPFxBXg6KHgRSX5SiMAFbyE40m6ks=";
  };

  build-system = [ hatchling ];

  dependencies = [
    hanzidentifier
    zhon
  ];

  pythonImportsCheck = [ "dragonmapper" ];

  meta = {
    description = "Identification and conversion functions for Chinese text processing";
    homepage = "https://github.com/tsroten/dragonmapper";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
