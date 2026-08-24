{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, six
,
}:

buildPythonPackage rec {
  pname = "whisper";
  version = "1.1.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "graphite-project";
    repo = "whisper";
    tag = version;
    hash = "sha256-CnCbRmI2jc67mTtfupoE1uHtobrAiWoUXbfX8YeEV6A=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "whisper" ];

  meta = {
    homepage = "https://github.com/graphite-project/whisper";
    description = "Fixed size round-robin style database";
    maintainers = [ ];
    license = lib.licenses.asl20;
  };
}
