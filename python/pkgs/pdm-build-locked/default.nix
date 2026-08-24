{ lib
, buildPythonPackage
, fetchFromGitHub
, pdm-backend
, build
,
}:

buildPythonPackage rec {
  pname = "pdm-build-locked";
  version = "0.3.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pdm-project";
    repo = "pdm-build-locked";
    tag = version;
    hash = "sha256-ONDKW3KIOKnrOWD/T/W7Do/4/CfgET4TpfYcLha5mVg=";
  };

  postPatch = ''
    substituteInPlace tests/conftest.py \
      --replace-fail '"pdm.pytest"' ""
    sed -i "/addopts/d" pyproject.toml
  '';

  build-system = [ pdm-backend ];

  pythonImportsCheck = [ "pdm_build_locked" ];

  meta = {
    description = "Pdm-build-locked is a pdm plugin to publish locked dependencies as optional-dependencies";
    homepage = "https://github.com/pdm-project/pdm-build-locked";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
