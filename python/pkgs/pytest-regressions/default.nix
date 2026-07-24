{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  matplotlib,
  numpy,
  pandas,
  pillow,
  pytest,
  pytest-datadir,
  pyyaml,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pytest-regressions";
  version = "2.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ESSS";
    repo = "pytest-regressions";
    tag = "v${version}";
    hash = "sha256-BojXizPr1b09YOa4wEeHQheyubKR2nBvtzLlcvt3380=";
  };

  build-system = [ setuptools-scm ];

  buildInputs = [ pytest ];

  dependencies = [
    pytest-datadir
    pyyaml
  ];

  optional-dependencies = {
    dataframe = [
      pandas
      numpy
    ];
    image = [
      numpy
      pillow
    ];
    num = [
      numpy
      pandas
    ];
  };
  pythonImportsCheck = [
    "pytest_regressions"
    "pytest_regressions.plugin"
  ];

  meta = {
    description = "Pytest fixtures to write regression tests";
    longDescription = ''
      pytest-regressions makes it simple to test general data, images,
      files, and numeric tables by saving expected data in a data
      directory (courtesy of pytest-datadir) that can be used to verify
      that future runs produce the same data.
    '';
    homepage = "https://github.com/ESSS/pytest-regressions";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
