{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
, hatch-vcs
,
}:

buildPythonPackage rec {
  pname = "picobox";
  version = "4.0.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "ikalnytskyi";
    repo = "picobox";
    tag = version;
    hash = "sha256-JtrwUVo3b4G34OUShX4eJS2IVubl4vBmEtB/Jhk4eJI=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "picobox" ];

  meta = {
    description = "Opinionated dependency injection framework";
    homepage = "https://github.com/ikalnytskyi/picobox";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
