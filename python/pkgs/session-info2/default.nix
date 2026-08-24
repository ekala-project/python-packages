{ lib
, buildPythonPackage
, fetchFromGitHub
, hatch-docstring-description
, hatch-vcs
, hatchling
,
}:

buildPythonPackage rec {
  pname = "session-info2";
  version = "0.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scverse";
    repo = "session-info2";
    tag = "v${version}";
    hash = "sha256-n568j109rnWxCWLsdu0RS7huVfUebzFshAd84i6ALM4=";
  };

  build-system = [
    hatch-docstring-description
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [
    "session_info2"
  ];

  meta = {
    description = "Report Python session information";
    homepage = "https://session-info2.readthedocs.io";
    license = lib.licenses.mpl20;
    maintainers = [ ];
  };
}
