{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, setuptools-scm
, coreutils
, jinja2
, pandas
, pyparsing
,
}:

buildPythonPackage rec {
  pname = "edalize";
  version = "0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "olofk";
    repo = "edalize";
    tag = "v${version}";
    hash = "sha256-5c3Szq0tXQdlyzFTFCla44qB/O6RK8vezVOaFOv8sw4=";
  };

  postPatch = ''
    substituteInPlace tests/test_edam.py \
      --replace /usr/bin/touch ${coreutils}/bin/touch
    patchShebangs tests/mock_commands/vsim
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ jinja2 ];

  optional-dependencies = {
    reporting = [
      pandas
      pyparsing
    ];
  };

  pythonImportsCheck = [ "edalize" ];

  meta = {
    description = "Abstraction library for interfacing EDA tools";
    mainProgram = "el_docker";
    homepage = "https://github.com/olofk/edalize";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
