{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  grpcio,
  hatchling,
  hatch-vcs,
  protobuf,
}:

buildPythonPackage rec {
  pname = "ghome-foyer-api";
  version = "1.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "KapJI";
    repo = "ghome-foyer-api";
    tag = "v${version}";
    hash = "sha256-hIprnkfAUbKoAp++sxu+T7MuGqLKOM1N1hqGBDOSo3k=";
  };

  buildInputs = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    grpcio
    protobuf
  ];

  doCheck = false; # no tests

  pythonRelaxDeps = [ "protobuf" ];

  meta = {
    description = "Generated Python protobuf stubs for Google Home internal API";
    homepage = "https://github.com/KapJI/ghome-foyer-api";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
